install.packages("caret")
library(caret)
data <- read.csv("../data/tema2/BostonHousing.csv")

training.ids = createDataPartition(data$MEDV, p = 0.8, list = F)
data.training <- data[training.ids,]
data.validation <- data[-training.ids,]

training.ids.2 <- createDataPartition(data$MEDV, p = 0.7, list = F)
data.training.2 <- data[training.ids.2,]
temp <- data[training.ids.2,]
validation.ids.2 <- createDataPartition(temp$MEDV, p = 0.5, list =F)
data.validation <- temp[validation.ids.2,]
                        ]



data2 <- read.csv("../data/tema2/boston-housing-classification.csv")

training.ids.3 <- createDataPartition(data2$MEDV_CAT, p = 0.7, list = F)
data.training.3 <- data2[training.ids.3,]
data.validation.3 <- data2[-training.ids.3,]



rda.cb.partition2 <- function(dataframe, target.index, prob){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p=prob, list = F)
  list(train = dataframe[training.ids,], val = dataframe[-training.ids])
}

rda.cb.partition3 <- function(dataframe, target.index,
                              prob.train, prob.val){
  library(caret)
  training.ids <- createDataPartition(dataframe[,target.index], p = prob.train, list = F)
  train.data <- dataframe[training.ids,]
  temp <- dataframe[-training.ids,]
  validation.ids <- createDataPartition(temp[,target.index], p = prob.val, list = F)
  list(train = train.data, val = temp[validation.ids], test = temp[-validation.ids])
}

data1 <- rda.cb.partition2(data, 14, 0.8)

# extraer datos aleatorios del dataframe

sample1 = sample(data$CRIM, 40, replace=F)
# remplace es si se quiere repetir
sample1