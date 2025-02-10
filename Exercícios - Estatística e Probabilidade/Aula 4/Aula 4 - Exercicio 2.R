#2)
library(ggplot2)
library(magrittr)

PIB <-c(2012000, 2062500, 2113160, 2143180, 2163800, 2210900, 2243200, 2321500, 2422900, 2491400)

Consumo <-c(1175010, 1214160, 1258570, 1263460, 1284600, 1303090, 1324650, 1355140, 1373720, 1404570)

Tabela <- data.frame(PIB, Consumo)
View(Tabela)

#Calculando covariancia diretamente
cov(Tabela$PIB, Tabela$Consumo, method = "pearson")
cov(Tabela$PIB, Tabela$Consumo, method = "spearman")

#Calculando o coeficiente de correlação diretamente
cor(Tabela$PIB, Tabela$Consumo, method = "pearson")
cor(Tabela$PIB, Tabela$Consumo, method = "pearson")

#Gráfico
Tabela%>%
  ggplot(aes(x = PIB, y = Consumo)) +
  geom_point(colour = "red")

#Reta ajustada - mínimos quadrados
Tabela_model <- lm(Consumo ~ PIB, data = Tabela)
Tabela_model$coefficients
summary(Tabela_model)

Tabela%>%
  ggplot(aes(x = PIB, y = Consumo)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)