#1)
#a) Calcule x médio e os desvios em relação à média.
df <- data.frame(GPa = c(116.4, 115.9, 114.6, 115.2, 115.8))

X_Medio <- mean(df$GPa)
X_Medio

Desvio_116.4 <- 116.4 - X_Medio
Desvio_116.4

Desvio_115.9 <- 115.9 - X_Medio
Desvio_115.9 

Desvio_114.6 <- 114.6 - X_Medio
Desvio_114.6 

Desvio_115.2 <- 115.2 - X_Medio
Desvio_115.2 

Desvio_115.8 <- 115.8 - X_Medio
Desvio_115.8 

#b) Use os desvios calculados na parte (a) para obter a variância amostral e o desvio padrão amostral.
Variancia_Amostral <- (Desvio_116.4^2 + Desvio_115.9^2 + Desvio_114.6^2 + Desvio_115.2^2 + Desvio_115.8^2) / (5 - 1) #N - 1 Pois é uma amostra
Variancia_Amostral

Desvio_Padrao <- sqrt(Variancia_Amostral)
Desvio_Padrao

#c) Subtraia 100 de cada observação para obter uma amostra de valores transformados. Agora calcule a variância amostral desses valores transformados e a compare aos 2 dos dados originais
df2 <- data.frame(GPa = c(16.4, 15.9, 14.6, 15.2, 15.8))

X_Medio2 <- mean(df2$GPa)
X_Medio2

Desvio_16.4 <- 16.4 - X_Medio2
Desvio_16.4

Desvio_15.9 <- 15.9 - X_Medio2
Desvio_15.9 

Desvio_14.6 <- 14.6 - X_Medio2
Desvio_14.6 

Desvio_15.2 <- 15.2 - X_Medio2
Desvio_15.2 

Desvio_15.8 <- 15.8 - X_Medio2
Desvio_15.8 

Variancia_Amostral2 <- (Desvio_16.4^2 + Desvio_15.9^2 + Desvio_14.6^2 + Desvio_15.2^2 + Desvio_15.8^2) / (5 - 1)
Variancia_Amostral2

#Deu os mesmos Valores da Letra B)
