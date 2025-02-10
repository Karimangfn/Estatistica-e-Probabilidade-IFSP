#2)
#a) Calcule os valores necessários à análise desse conjunto de dados
df <- data.frame(lamina_escleral = c(2.75, 2.62, 2.74, 3.85, 2.34, 2.74, 3.93, 4.21, 3.88,
                                     4.33, 3.46, 4.52, 2.43, 3.65, 2.78, 3.56, 3.01))

Somatoria_Xi <- sum(df$lamina_escleral)
Somatoria_Xi

Somatoria_Xi_ao_quadrado <- sum(df$lamina_escleral^2)
Somatoria_Xi_ao_quadrado

# Média
Media <- mean(df$lamina_escleral)
Media

# Mediana
Mediana <- median(df$lamina_escleral)
Mediana

# Desvios
Desvio_2.75 <- 2.75 - Media
Desvio_2.75

Desvio_2.62 <- 2.62 - Media
Desvio_2.62 

Desvio_2.74 <- 2.74 - Media
Desvio_2.74 

Desvio_3.85 <- 3.85 - Media
Desvio_3.85 

Desvio_2.34 <- 2.34 - Media
Desvio_2.34

Desvio_2.74 <- 2.74 - Media
Desvio_2.74

Desvio_3.93 <- 3.93 - Media
Desvio_3.93 

Desvio_4.21 <- 4.21 - Media
Desvio_4.21

Desvio_3.88 <- 3.88 - Media
Desvio_3.88 

Desvio_4.33 <- 4.33 - Media
Desvio_4.33

Desvio_3.46 <- 3.46 - Media
Desvio_3.46

Desvio_4.52 <- 4.52 - Media
Desvio_4.52 

Desvio_2.43 <- 2.43 - Media
Desvio_2.43 

Desvio_3.65 <- 3.65 - Media
Desvio_3.65 

Desvio_2.78 <- 2.78 - Media
Desvio_2.78

Desvio_3.56 <- 3.56 - Media
Desvio_3.56 

Desvio_3.01 <- 3.01 - Media
Desvio_3.01 

# Variancia
Variancia <- (Desvio_2.75^2 + Desvio_2.62^2 + Desvio_2.74^2 + Desvio_3.85^2 + Desvio_2.34^2 +
                Desvio_2.74^2 + Desvio_3.93^2 + Desvio_4.21^2 + Desvio_3.88^2 + Desvio_4.33^2 +
                Desvio_3.46^2 + Desvio_4.52^2 + Desvio_2.43^2 + Desvio_3.65^2 + Desvio_2.78^2 +
                Desvio_3.56^2 + Desvio_3.01^2) / (17 - 1) #N - 1 Pois é uma amostra 

Variancia

# Desvio Padrão
Desvio <- sqrt(Variancia)
Desvio

#b) Determine os quartos inferior e superior

df_Ordenado <- data.frame(lamina_escleral = c(df[order(df$lamina_escleral),]))
View(df_Ordenado)

quarto_inferior <- quantile(df_Ordenado$lamina_escleral, c(0.25))
quarto_inferior

quarto_superior <- quantile(df_Ordenado$lamina_escleral, c(0.75))
quarto_superior

#c) Calcule o valor da dispersão entre os quartos

Disperção <-  as.double(quarto_superior - quarto_inferior)
Disperção

#d) Se os dois maiores valores da amostra, 4,33 e 4,52, fossem 5,33 e 5,52, como fs seria afetado? Explique.
df_alterado <- data.frame(lamina_escleral = c(2.75, 2.62, 2.74, 3.85, 2.34, 2.74, 3.93, 4.21, 3.88,
                                              5.33, 3.46, 5.52, 2.43, 3.65, 2.78, 3.56, 3.01))

df_alterado_Ordenado <- data.frame(lamina_escleral = c(df_alterado[order(df_alterado$lamina_escleral),]))
View(df_alterado_Ordenado)

quarto_inferior_alterado <- quantile(df_alterado_Ordenado$lamina_escleral, c(0.25))
quarto_inferior_alterado

quarto_superior_alterado <- quantile(df_alterado_Ordenado$lamina_escleral, c(0.75))
quarto_superior_alterado

Disperção_alterado <-  as.double(quarto_superior_alterado - quarto_inferior_alterado)
Disperção_alterado

#O Valor de fs não teve mudanças

#e) Em quanto a observação 2,34 pode ser aumentada sem afetar fs? Explique.
Observacao <- 2.74 - 2.34
Observacao

#f) Se uma 18' observação, x18 = 4,60, fosse adicionada à amostra, qual seria o valor de fs?
df_adicionado18 <- data.frame(lamina_escleral = c(2.75, 2.62, 2.74, 3.85, 2.34, 2.74, 3.93, 4.21, 3.88,
                                                  4.33, 3.46, 4.52, 2.43, 3.65, 2.78, 3.56, 3.01, 4.60))

df_Ordenado_18 <- data.frame(lamina_escleral = c(df_adicionado18[order(df_adicionado18$lamina_escleral),]))
View(df_Ordenado_18)

quarto_inferior_18 <- quantile(df_Ordenado_18$lamina_escleral, c(0.25))
quarto_inferior_18

quarto_superior_18 <- quantile(df_Ordenado_18$lamina_escleral, c(0.75))
quarto_superior_18

Disperção_18 <-  (quarto_superior_18 - quarto_inferior_18)
Disperção_18
