#' Function to rescale a matrix between 0 and 1
#'
#' This function takes a symmetrical matrix as input and re-scales
#' it to values ranging from 0 to (+) 1
#'
#' @param matrix symmetrical matrix of numerical values
#' @return the inputted matrix, but rescaled from 0 to (+) 1
#' @export
scale_matrix <- function(matrix){

  scale_matrix <- (matrix - min(matrix))/(max(matrix) - min(matrix))

  return(scale_matrix)
}

#' Function to rank dataframe by specific index
#'
#' This function will re-order a matrix or dataframe by a specified index.
#' For example, if you have a dataframe with a specified subject/participant ID column
#' and you have an index of these ids already ordered in (i.e.) ascending height
#' you can give this function your ordered index of values and it will re-arrange your entire
#' dataframe by that order (i.e ascending height)
#'
#' @param df matrix/dataframe that you wish to order
#' @param index the index of values you wish to order by
#' @param df_index_id string value that corresponds to the name of the column in the dataframe containing the values you wish to order it by
#' @return reordered matrix/dataframe
#' @export
rank_matrix <- function(df, index, df_index_id){

  index_df <- data.frame(id=index,weight=1:length(index))
  col2rm <- c("weight")

  merged_df_tmp <- merge(df,index_df,by.x=df_index_id,by.y='id',all.x=T,all.y=T)
  ranked_matrix <- merged_df_tmp[order(merged_df_tmp$weight),]
  ranked_matrix <- ranked_matrix[ , !(names(ranked_matrix) %in% col2rm)]

  return(ranked_matrix)
}

#' Function to reorder and scale N x N+1 matrix by index
#'
#' This function will reorder (and scale to 0->1 if scale_matrix is set to TRUE)
#' a symmetrical matrix that has an additional column (hence NxN+1) containing
#' the subject/participant IDs, as they are currently ordered.
#' This function takes as input an index of subject/participant ids that is already
#' ordered by some metric (i.e. ascending height). It then re-orders your symmetrical
#' matrix, removes the ID column returning it to its NxN state, and returns
#' a re-ordered symmetric matrix
#'
#' @param df symmetric matrix you wish to re-order
#' @param index ordered list of subject/participant ids
#' @param df_index_id string value that is the column name of participant ids
#' @param scale_matrix set to TRUE if you want to scale your matrix from 0 to 1, FALSE if you don't
#' @return original symmetric matrix ordered by the index order
#' @export
rank_subxsub_mat <- function(df, index, df_index_id, scale_matrix){

  rownames(df) <- df[,df_index_id]
  mat_df <- df[ , !(names(df) %in% df_index_id)]
  mat_df <- as.matrix(mat_df)
  colnames(mat_df) <- rownames(mat_df)
  ranked_matrix <- graph4lg::reorder_mat(mat_df, index)
  if(scale_matrix==TRUE){ranked_matrix <- scale_matrix(ranked_matrix)}

  return(ranked_matrix)
}

#' Function to compute nearest neighbor similarity
#'
#' @param behave_data ordered vector of data you want to compute similarity on
#' @return n x n similarity matrix
#' @export
nearest_neighbours <- function(behave_data){

  nearest_neighbours_df <- data.frame()

  sample_max <- max(behave_data)

  for (i in 1:length(behave_data)){

    for (j in 1:length(behave_data)){

      output_nn <- sample_max - (abs(behave_data[[i]] - behave_data[[j]]))
      nearest_neighbours_df[i, j] <- output_nn

    }}

  return(nearest_neighbours_df)
}

#' Function to compute convergence similarity
#'
#' @param behave_data ordered vector of data you want to compute similarity on
#' @return n x n similarity matrix
#' @export
convergence <- function(behave_data){

  convergence_df <- data.frame()

  for (i in 1:length(behave_data)){

    for (j in 1:length(behave_data)){

      pair_vec <- c(behave_data[[i]], behave_data[[j]])

      output_conv <- min(pair_vec)
      convergence_df[i, j] <- output_conv

    }}

  return(convergence_df)
}

#' Function to compute divergence similarity
#'
#' @param behave_data ordered vector of data you want to compute similarity on
#' @return n x n similarity matrix
#' @export
divergence <- function(behave_data){

  divergence_df <- data.frame()

  sample_max <- max(behave_data)

  for (i in 1:length(behave_data)){
    for (j in 1:length(behave_data)){

      pair_vec <- c(behave_data[[i]], behave_data[[j]])
      output_conv <- min(pair_vec)
      divergence_df[i, j] <- (sample_max - output_conv)

    }}

  return(divergence_df)
}

#' Function to compute bow tie similarity
#'
#' @param behave_data ordered vector of data you want to compute similarity on
#' @param center_value the value around which you want to center your similarity matrix
#' @return n x n similarity matrix
#' @export
bow_tie <- function(behave_data, center_value){

  bow_tie_df <- data.frame()

  for (i in 1:length(behave_data)){
    for (j in 1:length(behave_data)){

      #pair_vec <- c(behave_data[[i]], behave_data[[j]])
      mean_pair <- (behave_data[[i]] + behave_data[[j]])/2

      difference <- 1 + (abs(behave_data[[i]]-behave_data[[j]])/100)

      # first we compute the z-score value of the distance of the pair mean
      # from a value that represents the center ('pivot') point in the data
      # we are interested in. This can either be the actual mean/median of the
      # data we have (however as Mike pointed out this will mean our similarity
      # values will be centered around the center of it's own data. In this case
      # I am interested in age, if I use the mean age of this sample which is skewed
      # towards younger children then similarity values will reflect the tail ends
      # of this distributions, rather than the tail ends of the normal distribution of
      # ages in all children - god I'm not describing myself well right now).
      #
      # So I want to pick a theoretical point at which similarity should diverge
      # or converge from, which is the variable center_value in this function.

      variance_pair2center <- abs((mean_pair - center_value))

      # dividing by the difference means that pairs furthest away from the
      # diagonal, .e. have a large difference between them, WHICH WE WANT TO BE DISSIMILAR
      # have higher 'z-score' values (further from the mean)

      diff_weight <- variance_pair2center/difference

      bow_tie_df[i, j] <- (diff_weight)

    }}

  return(bow_tie_df)

} # end function bow_tie

#' Function to scale your similarity matrix and set diagonal to 1
#'
#' @param similarity_matrix the matrix you get out of running one of the similarity models (i.e., divergence(your_mat))
#' @param index the ordered list of subject/participant ids
#' @param organize_row set to TRUE if you want to add rownames that correspond to your ids to your matrix
#' @return clean similarity matrix
#' @export
fix_diagonal <- function(similarity_matrix, index, organize_row){

  fixed_similarity_matrix <- scale_matrix(similarity_matrix)

  # replace diagonal values with 1
  diag(fixed_similarity_matrix) <- round(1, digits = 0)

  if(organize_row==TRUE){rownames(fixed_similarity_matrix) <- index}

  return(fixed_similarity_matrix)
}

#' Function to compute all similarity models at once and collect them into a single list
#' @param behave_vec ordered vector of data you want to compute similarity on
#' @param index the ordered list of subject/participant ids
#' @param center_value the value around which you want to center your bow_tie similarity matrix
#' @param resultpath the path to the directory where you want your resulting similarity matrices to be stored as .csv files
#' @param save_out if set to TRUE, will save out your similarity matrices as .csv files in your resultpath directory
#' @return list containing all four similarity matrices (nearest neighbours, convergence, divergence, and bow-tie)
#' @export
make_similarity_matrices <- function(behave_vec,
                                     index,
                                     center_value,
                                     resultpath,
                                     save_out){

  behave_nn <- nearest_neighbours(behave_vec) # absolute difference
  behave_conv <- convergence(behave_vec) # minimum pair
  behave_div <- divergence(behave_vec) # max(sample) - minimum pair
  behave_bow <- bow_tie(behave_vec, center_value) # see function

  dataframes2loopthrough <- do.call("list", mget(c("behave_nn", "behave_conv",
                                                   "behave_div","behave_bow")))

  for (df in 1:length(dataframes2loopthrough)){

    df2use <- dataframes2loopthrough[[df]]

    dfname <- names(dataframes2loopthrough)

    final_df <- scale_matrix(df2use)

    # replace diagonal values with 1
    diag(final_df) <- round(1, digits = 0)
    rownames(final_df) <- index

    assign(dfname[df], final_df)

    saveoutfilepath <- file.path(resultpath,
                                 'final_similarity_matrices',
                                 paste0(dfname[df], ".csv"))

    if(save_out == TRUE){write.csv(final_df, saveoutfilepath, row.names=FALSE)}

  }

  dataframes2loopthrough <- do.call("list", mget(c("behave_nn", "behave_conv",
                                                   "behave_div","behave_bow")))


  return(dataframes2loopthrough)

} # end function run behave model similarity

