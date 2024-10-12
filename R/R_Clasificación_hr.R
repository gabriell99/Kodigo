library(caret)
library(rpart)
library(rpart.plot)

#Leer datos
ds<-read.table("C:/KodigoGG/Datasets/hr_data.csv",dec=".",sep=",",header=TRUE,colClasses=c("numeric","numeric","numeric","numeric","numeric","factor","factor","factor","factor","factor"))
#attach(ds)

#Descartar variables inútiles
ds[["division"]] <- NULL
ds[["work_accident"]] <- NULL

#Generar conjuntos de entrenamiento y prueba (70%-30%) mediante muestreo aleatorio
set.seed(1977)
trainIndex <- createDataPartition(ds$left, p = 0.7,list = FALSE,times = 1) 
train <- ds[ trainIndex,]
test <- ds[-trainIndex,]

#Establecer el modo de evaluación (CV de 10 veces, repetido 3 veces)
eval.mode <- trainControl(method = "repeatedcv", number = 10, repeats = 3, classProbs = TRUE, summaryFunction = twoClassSummary)


---CART------------------------------------------------
#Investigar los valores de los parámetros predeterminados
CART.model <- train(left~., data = train, method="rpart", trControl = eval.mode, metric="ROC")

#Establezca la cuadrícula de parámetros y encuentre el mejor modelo
CART.grid <- expand.grid(cp = (1:20)*0.01)
CART.model <- train(left~., data = train, method="rpart", trControl = eval.mode, tuneGrid = CART.grid, metric="ROC")
#de lo contrario....metric="Sens", metric="Sens"
plot(CART.model)

#Leer y visualizar el mejor modelo
CART.model$finalModel
rpart.plot(CART.model$finalModel,tweak=1.1,extra=1)

#Generar predicciones para los ejemplos en el conjunto de prueba (ejemplos de reserva)
CART.preds.class <- predict(CART.model,test)
confusionMatrix(CART.preds.class, test$left, positive = "yes")
CART.preds.prob <- predict(CART.model,test,type = "prob")

#Construya el gráfico de ganancia acumulada en el conjunto de prueba
gain_chart <- data.frame(class = test$left)
gain_chart$CART <- CART.preds.prob$yes
cum.gain <- lift(class ~ CART, class = "yes", data = gain_chart)
plot(cum.gain, lwd = 3, col = "black", xlab="% De población alcanzada", ylab = "% De respuestas positivas verdaderas", cex =1.3)