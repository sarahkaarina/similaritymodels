# Build theoretical similarity models w/ similaritymodels

**About**: R package to create similarity models (nearest neighbors, convergence, divergence, and bow tie)

The R package 'similarity models' use functions built on the basis of previous work by Finn et al., (2020) and Camacho et., (2023). It also includes an additional function (bow_tie()) developed and built by the author Sarah K. Crockford, with conceptual input from Michael V. Lombardo. 

# Project background

In research, we often come across highly heterogenous data. Examples from my own research are not limited to but have included autistic participants who can range in incredibly to minimally verbal to multilingual children who range from children who might hear multiple langauges in their environment but speak only one to children who are highly expressive in all of their languages. Two main approaches in the field of psychology/linguistics for dealing with such data might be to compare case to control by looking at mean comparisons (i.e. monolingual to multilingual) or to observe linear effects (i.e. auistic traits against verbal ability). 

However, in the first approach, you might end up losing a lot of information in your highly heterogneous multilingual group as you collapse them into one average value. Doing so might not reveal a lot of significant differences between your monolingual and multilingual group, as you extreme ends (your 'functionally monolingual' multiliugals and your 'super polygots') become collapsed together. You could remove them from your sample or ever increase the exclusion criteria for your study, but why place limits that could preclude the identification of important, significant differences between monolinguals and multilinguals? 

In the second approach (using linear models), we face another dilemma: what if extemes of your sample (i.e. having a high number of autistic traits) relates to both high and low verbal ability? If this were the case, then your linear model might stuggle to find a significant increasing and/or decreasing relationship between autistic traits and verbal ability as higher autistic traits, in this example, could relate to both extreme and extreme low value for verbal behaviour. Directionality, therefore, may not be as important as similarity when it comes to high or low autistic traits and verbal performance.

As research in general moves towards more naturalistic paradigms in order to glean into neural and cognitive behaviour as it relates to processing 'real world data', so does the introduction of naturalistic paradigms facilitate the inclusion of larger population samples. To return to both of my case studies, multilingual and autistic children, this means that children who have varying degrees of expressive multilingualism could take part in experiments that don't require specific verbal skills and autistic children with varying degrees of intellectual ability and sensory sensitivities can take part in experiments that require little to no verbal instructions.

Therefore, we need to consider different analytical approaches that allows us to full capture these hetergenous samples and how they might relate to a specific neural or cognitive response. In their work, Finn et al (2020) and Camacho et al (2023) already demonstrate how we can do so by modellng subject pair similarity. That is, we can look at subject by subject similarity in a given response (in their case fMRI/BOLD response data) and develop theoretical similarity models that might explain these subject by subject responses. For example, Finn et al., (2020) show that people who perform more similairly on a working memory task, also show more similar neural responses. More specifically, they are able to  model that the better people perform on the task, the more similar their brain activity is, whilst people poorer people perform the less similar their neural reponses will be. Camacho et al., (2023) also adopt a similar strategy to demonstrate, in a sample of children aged 5 to 21, that as children become older they also become more similar in their neural responses to watching certain video stimuli. This work demonstrates the utility of capturing subject by subject similarity, as it allows for the modelling of heterogeneity in a single sample. A linear approach, for example, might not have been able to show that better working memory performance relates to increased or decreased neural signal as it would have been bogged down by ever increasing disparate values as in subjects with lower working memory ability. 

To this aim, this package has collected all three models used by Finn et al., (2020) and Camacho et al., (2023), namely: nearest neighbors, convergence, and divergence. It also adds a new model, developed to model similarity a the tail end extremes of a given sample, so called: bow tie. We explain the theory behind models and the equations used to compute similarity in further detail below:

1) **Nearest Neighbours**: 
2) **Convergence**:
3) **Divergence**:
4) **Bow Tie**:


# Installation 

To install the package into your R/RStudio enviornment, use the folloing command:

$ devtools::install_github("sarahkaarina/similaritymodels")

If you don't already have devtools installed, you can use the install.packages() comnan in R:

$ install.packages("devtools")

# References

If you use this package, please cite:

Crockford, S. K., Lombardo, M. V., (2024). Modelling developmental changes in narrative similarity. *Working in progress* 

Also consider citing:

Finn, E. S., Glerean, E., Khojandi, A. Y., Nielson, D., Molfese, P. J., Handwerker, D. A., & Bandettini, P. A. (2020). Idiosynchrony: From shared responses to individual differences during naturalistic neuroimaging. NeuroImage, 215, 116828.

Camacho, M. C., Nielsen, A. N., Balser, D., Furtado, E., Steinberger, D. C., Fruchtman, L., ... & Barch, D. M. (2023). Large-scale encoding of emotion concepts becomes increasingly similar between individuals from childhood to adolescence. Nature neuroscience, 26(7), 1256-1266.

# Contact information

You can submit issues relating to this package to this git-hub page.

For any further queries, you can contact me at:

**personal email**: sarahcrockford@mac.com
**current institutional email**: sarah.crockford@iit.it
