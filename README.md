# Build theoretical similarity models w/ similaritymodels

**About**: R package to create similarity models (nearest neighbors, convergence, divergence, and bow tie)

The R package 'similarity models' uses functions built on the basis of previous work by Finn et al., (2020) and Camacho et., (2023). It also includes an additional function (bow_tie()) developed and built by the author Sarah K. Crockford, with conceptual input from Michael V. Lombardo. 

# Project background

In research, we often come across highly heterogenous data. Examples from my own research have included autistic participants who can range in incredibly to minimally verbal, to multilingual children who range from children who might hear multiple langauges in their environment but speak only one, to children who are highly expressive in all of their languages. Two main approaches in the field of psychology/linguistics for dealing with such data might be to compare groups by using mean comparisons (i.e. monolingual to multilingual) or to observe linear/relational effects (i.e. auistic traits against verbal ability). 

However, in the first approach, a lot of important information might be loss as a highly heterogneous multilingual group gets collapsed into one average value. Doing so might not reveal a lot of significant differences between monolingual and multilingual groups, as the extreme ends ('functionally monolingual' multiliugals and 'super polygots') become averaged together. One could remove them from their sample or ever increase the exclusion criteria for a given study, but why place limits that could preclude the identification of important, significant differences between monolinguals and multilinguals? 

In the second approach, using linear models, we face another dilemma: what if the extemes of a given sample (i.e. having a high number of autistic traits) relate to both high and low verbal ability? If this were the case, then a linear model might stuggle to find a significant increasing and/or decreasing relationship between autistic traits and verbal ability as higher autistic traits could relate to both extreme and extreme low values for verbal behaviour. Directionality, therefore, may not be as important as similarity when it comes to understanding how high or low autistic traits relate to verbal performance.

As research moves towards more naturalistic paradigms in order to understand how people process the true world around them, so does the introduction of naturalistic paradigms facilitate the inclusion of larger, more disparate population samples. If we look at both multilingual and autistic children, it means that children with varying degrees of expressive multilingualism and autistic children with varying degrees of verbal ability can take part in experiments that don't require specific verbal skills and/or require little to no verbal instructions.

To this aim, this R package ('similaritymodels') has collected all three models developed by Finn et al., (2020) and also used by Camacho et al., (2023), namely: nearest neighbors, convergence, and divergence. It also adds a new model, developed to model similarity a the tail end extremes of a given sample, so called 'bow tie'. 

Each of these similarity models takes a n x 1 vector (or single column of n rows) and computes a similarity matrix for each, individual value in your vector (or each individual row in your single column, if you prefer to think that way). Each function then returns a n x n matrix of similarity values, where your diagonal will be value(i) to value(i) similarity. 

Your similarity matrix will be symmetric, meaning your upper and lower triangles will contain the same values. Depending on the data and similarity metric you use, similairty values will vary on their respective numerical scales and diagonal values. Therefore you have the option to rescale your matrix from 0 to 1 values and set the diagonal to 1 using the function fix_diagonal(). 

If you only want to rescale but not manually set your diagonal to 1 values, you can just use the function scale_matrix(). The scale_matrix() function uses the same scaling computation as Finn et al's function, which you can find documented here: https://github.com/esfinn/intersubj_rsa/blob/master/isRSA_HCP_demo.ipynb 

Below, we'll explain the theory behind these models and the equations used to compute similarity in further detail below:

1) **Nearest Neighbours**: 
2) **Convergence**:
3) **Divergence**:
4) **Bow Tie**:

*I hope to continue adding more models and testing new theoretical similarity 'shapes'. So check back on this page to see if I've updated the package with more similarity functions!*

# Installation 

To install the package into your R/RStudio enviornment, use the folloing command:

$ devtools::install_github("sarahkaarina/similaritymodels")

If you don't already have devtools installed, you can use the install.packages() command in R:

$ install.packages("devtools")

# References

If you use this package, please cite:

Crockford, S. K., Lombardo, M. V., (2024). Modelling developmental changes in narrative similarity. *Work in progress* 

Also consider citing:

Finn, E. S., Glerean, E., Khojandi, A. Y., Nielson, D., Molfese, P. J., Handwerker, D. A., & Bandettini, P. A. (2020). Idiosynchrony: From shared responses to individual differences during naturalistic neuroimaging. NeuroImage, 215, 116828.

Camacho, M. C., Nielsen, A. N., Balser, D., Furtado, E., Steinberger, D. C., Fruchtman, L., ... & Barch, D. M. (2023). Large-scale encoding of emotion concepts becomes increasingly similar between individuals from childhood to adolescence. Nature neuroscience, 26(7), 1256-1266.

# Contact information

You can submit issues relating to this package to this git-hub page.

For any further queries, you can contact me at:

**personal email**: sarahcrockford@mac.com

**current institutional email**: sarah.crockford@iit.it
