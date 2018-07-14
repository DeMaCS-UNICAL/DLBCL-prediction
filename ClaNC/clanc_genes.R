source("clanc.R")
Y_train = read.delim("train5_GSE23501_series_matrix_survival_senzaGSM575663_Affymetrix133a_claNC-ordered.txt", header = T)
Y_test = read.delim("test5_GSE23501_series_matrix_survival_senzaGSM575663_Affymetrix133a_claNC-ordered.txt", header = T)

rownames(Y_train) = Y_train[, 1]
rownames(Y_test) = Y_test[, 1]
Y_train = as.matrix(Y_train[, -1])
Y_test = as.matrix(Y_test[, -1])

id = rep(1:2, each = 29)  

gene_names = rownames(Y_train)

## Now ready to use cross-validation to estimate the error rates for 
## classifiers of different sizes (different numbers of genes used in 
## building the classifier).
cv_out = cvClanc(Y_train, id)

cv_out = cvClanc(Y_train, id,"equal",1:33)

train_out = trainClanc(Y_train, id, gene_names)
build_out = buildClanc(Y_train, id, class_names, train_out, active = 5)

## And if we have test data, we can test the classifier on them.  In our 
## example, we make one misclassification (for one of the samples in class 
## 4.
test_out = testClanc(Y_test, id, gene_names, build_out)

