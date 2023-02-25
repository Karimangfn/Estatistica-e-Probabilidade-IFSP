#Filtros em Dataframes

setwd("C:/Users/Kariman/Desktop/Dataframe-Estudo")
df <- read.csv("marca_carro.csv")

df[1]
df[1,]

#Dataframe linha e coluna
df[1:3]
df[-2]

df[1,1]
df[1,1:2]
df[1,-2]

df[1:1,1:2]
df[-1,-2]

#Modificando o Dataframe
df <- df[c(-3,-4,-5,-6)]

#Filtrando as Variaveis
df[1,1]
df$marca_carro[1]
df$cod_marca[1:2]
df[df$marca_carro == 1,]

#Modificando o Dataframe
df <- df[df$marca_carro == 1,]

#Dataframe x Dataframe1
df1 <- read.csv("marca_carro.csv")
View(df1)
View(df)
