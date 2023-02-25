#Dataframe

#Definir area de trabalho
setwd("C:/Users/Kariman/Desktop/Dataframe-Estudo")

#Importando base de dados
df <- read.csv("marca_carro.csv")

#Analisando Dataframe
View(df)

#Tipos de Dados
str(df)
summary(df)

#Selecionando Variaveis
df[1]
df$marca_carro #Com sinall "$" da para se escolher uma tabela

Col1 <- df[1]
Col2 <- df$cod_marca

class(df$marca_carro)
class(Col1)
class(Col2)

#Modificando o Dataframe

#Excluindo variável
df$marca_carro <- NULL

#Alterando variável
df$cod_marca
summary(df$cod_marca)
df$cod_marca <- as.factor(df$cod_marca)

#Criando uma nova variável dentro do Dataframe
df$Nova <- "a"
class(df$Nova)
df$Nova <- c(2,5,7)
df$Nova <- c(2,5,7,NA,NA,NA)
df$Nova <- NULL
df$Nova <- NA
df$Nova[1:3] <- C(1,3,7) 
