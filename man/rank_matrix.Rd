% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/build_similarity_models.R
\name{rank_matrix}
\alias{rank_matrix}
\title{Function to rank dataframe by specific index}
\usage{
rank_matrix(df, index, df_index_id)
}
\arguments{
\item{df}{matrix/dataframe that you wish to order}

\item{index}{the index of values you wish to order by}

\item{df_index_id}{string value that corresponds to the name of the column in the dataframe containing the values you wish to order it by}
}
\value{
reordered matrix/dataframe
}
\description{
This function will re-order a matrix or dataframe by a specified index.
For example, if you have a dataframe with a specified subject/participant ID column
and you have an index of these ids already ordered in (i.e.) ascending height
you can give this function your ordered index of values and it will re-arrange your entire
dataframe by that order (i.e ascending height)
}
