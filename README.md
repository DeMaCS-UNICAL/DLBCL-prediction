# DLBCL-prediction
Classification and survival prediction in Diffuse Large B-cell Lymphoma (DLBCL) by gene expression profiling

# Description
In this work we propose a novel approach for class prediction from gene expression data and survival analysis of tumor and immune subtype; we are interested in finding subset of genes which have a significant impact on survival probability. In particular, our approach relies on the definition of two groups based on the amount of certain member cell types composing the genes, and on a Kaplan-Meier survival analysis that aims at understanding which group has more chances to survive.
Genes can be identified by taking into account the fact that, if the presence of some set of genes changes, the composition of the groups changes accordingly, and hence the survival probability. In our approach, we make use of three machine-learning techniques in order to identify gene candidates: Prediction Analysis for Microarrays (PAM), Classification to Nearest Centroids (ClaNC) and Proportional Overlapping Score (POS).

# Cibersort
The definition of the two groups based on the amount of certain member cell types are performed using https://cibersort.stanford.edu/

# Prediction Analysis for Microarrays
Run as `Rscript PAM/PAM_genes.R dataset_path`. This script returns a list of the most relevant genes according to our analysis. `dataset_path` is the path of the dataset.

utils scripts credits to https://github.com/cran/pamr/tree/master/R

# Classification to Nearest Centroids (ClaNC) 
Run as `Rscript ClaNC/clanc_genes.R number_classes samples`. This script returns a list of the most relevant genes according to our analysis. `dataset_path` is the path of the dataset, `number_classes` is the number of classes for classification and `samples` is the number of samples in the dataset.

utils scripts credits to https://rdrr.io/github/naikai/sake/src/R/clanc.R

# Proportional Overlapping Score (POS)
Run as `Rscript POS/POS_genes.R dataset_path class_path genes_path`. This script returns a list of the most relevant genes according to our analysis. `dataset_path` is the path of the dataset, `class_path` is the path of the file composed of the classes of each sample and `genes_path` is the path of the file composed of all genes present in the dataset, respectively.

utils scripts credits to https://cran.r-project.org/web/packages/propOverlap/index.html
