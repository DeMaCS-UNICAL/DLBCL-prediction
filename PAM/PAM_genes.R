source('pamr.from.excel.R')
source('pamr.train.R')
source('pamr.cv.R')
source('pamr.listgenes.R')
source('pamr.plotcv.R')
source('pamr.plotcen.R')

#Read dataset
khan.data <- pamr.from.excel(argv[0], sample.number, sample.labels=TRUE)
lapply(khan.data, function(x) replace(x, is.nan(x), 0))

##Train the classifier
khan.train <- pamr.train(khan.data)

##10-Cross-validate the classifier
khan.results<- pamr.cv(khan.train, khan.data)
pamr.plotcv(khan.results)

pamr.plotcen(khan.train, khan.data, threshold=1.8)

##List the significant genes
x <- pamr.listgenes(khan.train, khan.data, threshold=1.8)
x[0:10,]

