# 1)
# a) Determine as frequências e frequências relativas dos valores observados de x = número de transdutores fora das especificações em um lote. 
df <- data.frame(transdutores = c(2, 1, 2, 4, 0, 1, 3, 2, 0, 5, 3, 3, 1, 3, 2, 4, 7, 0, 2, 3,
                                  0, 4, 2, 1, 3, 1, 1, 3, 4, 1, 2, 3, 2, 2, 8, 4, 5, 1, 3, 1,
                                  5, 0, 2, 3, 2, 1, 0, 6, 4, 2, 1, 6, 0, 3, 3, 3, 6, 1, 2, 3))

Freq_Absoluta <- table(df$transdutores)
Freq_Absoluta

Total = sum(Freq_Absoluta)
Total

Freq_Relativa <- Freq_Absoluta/Total
Freq_Relativa

df_Frequencia <- data.frame(Transdutores = c(0:8), Frequencia_Absoluta = c(Freq_Absoluta), Frequencia_Relativa = c(Freq_Relativa))
View(df_Frequencia)

# b) Que proporção de lotes na amostra possui no máximo cinco transdutores fora das especificações? Que proporção tem menos de cinco? Que proporção possui no mínimo cinco unidades fora das especificações?
# Maximo 5 transdutores
Maximo_5 <- sum(df_Frequencia$Frequencia_Relativa[1:6])
Maximo_5

# Menos de 5 transdutores
Menos_5 <- sum(df_Frequencia$Frequencia_Relativa[1:5])
Menos_5

# No minimo 5 transdutores
Minimo_5 <- sum(df_Frequencia$Frequencia_Relativa[6:9])
Minimo_5


# c) Desenhe um histograma dos dados, usando a frequência relativa na escala vertical e comente suas características. 
library(ggplot2)

ggplot(df_Frequencia, aes(x = Transdutores, y = Frequencia_Relativa)) +
  geom_histogram(stat='identity') +
  ggtitle("Frequencia")
