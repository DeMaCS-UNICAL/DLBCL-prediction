source("clanc.R")

data = argv[0]
number_classes = argv[1]

train_index <- sample(1:nrow(data), 0.8 * nrow(data))
test_index <- setdiff(1:nrow(data), train_index)

# Build X_train, y_train, X_test, y_test
Y_train <- adult[train_index, ]

Y_test <- adult[test_index, ]

rownames(Y_train) = Y_train[, 1]
rownames(Y_test) = Y_test[, 1]
Y_train = as.matrix(Y_train[, -1])
Y_test = as.matrix(Y_test[, -1])

## Create vector for class membership.
id = rep(1:number_classes, each = features)  

## Set the class names
class_names = 1:number_classes
gene_names = rownames(Y_train)

## Cross-validation is used to estimate the error rates for 
## classifiers of different sizes (different numbers of genes used in 
## building the classifier).
cv_out = cvClanc(Y_train, id)
cv_out = cvClanc(Y_train, id,"equal",1:features)

## View the estimated error rates associated with different feature-set sizes.
## Useful to choose the best number of feature such that the accuracy is higher.

plot(1:features, cv_out$overallErrors, type = "l", lwd = 1, col = "blue", xlab = "Number of features", ylab = "CV error")

train_out = trainClanc(Y_train, id, gene_names)
build_out = buildClanc(Y_train, id, class_names, train_out, active = number_feature) 
build_out$cntrds

## Test the classifier on test set.
test_out = testClanc(Y_test, id, gene_names, build_out)

