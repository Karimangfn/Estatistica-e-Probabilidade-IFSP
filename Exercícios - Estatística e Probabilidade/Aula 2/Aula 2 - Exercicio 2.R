# 2)
#a) Por que uma distribuição de frequência não pode ter por base os intervalos de classe 0-50, 50-100, 100-150 e assim por diante?
#Resposta: Porque os Limites Inferiores e Superiores de cada Classe pertencem a mais de uma Classe, o ideal seria 0-49, 50-99, 100-149...

#b) Construa uma distribuição de frequência e um histograma dos dados usando limites de classes O, 50, 100, ... e então faça comentários sobre as características interessantes.
df <- data.frame(Vida_Util =  c( 11,  14,  20,  23,  31,  36,  39,  44,  47,  50, 
                                 59,  61,  65,  67,  68,  71,  74,  76,  78,  79,
                                 81,  84,  85,  89,  91,  93,  96,  99, 101, 104, 
                                105, 105, 112, 118, 123, 136, 139, 141, 148, 158,
                                161, 168, 184, 206, 248, 263, 289, 322, 388, 513))


Classe <- cut(df$Vida_Util, breaks=c(0, 49, 99, 149, 199, 249, 299, 349, 399, 449, 499, 550))

Freq_Absoluta = table(Classe)
Freq_Absoluta

Total = sum(Freq_Absoluta)
Total

Freq_Relativa <- Freq_Absoluta/Total
Freq_Relativa

df_Frequencia <- data.frame(Frequencia_Absoluta = c(Freq_Absoluta), Frequencia_Relativa = c(Freq_Relativa))
View(df_Frequencia)

#Histograma
library(ggplot2)

ggplot(df_Frequencia, aes(x = row.names(df_Frequencia), y = Frequencia_Relativa)) +
  geom_histogram(stat='identity') +
  ggtitle("Frequencia")

#c) Que proporção das observações de vida útil dessa amostra é inferior a 100? Que proporção das observações é igual ou maior que 200?
#Inferior a 100
Inferior_100 <- sum(df_Frequencia$Frequencia_Relativa[1:2])
Inferior_100

#Inferior a 100 porém com o enunciado certo
Inferior_100_Enum <- sum(df_Frequencia$Frequencia_Relativa[2])
Inferior_100_Enum

#Maior que 200
Maior_200 <- sum(df_Frequencia$Frequencia_Relativa[5:11])
Maior_200