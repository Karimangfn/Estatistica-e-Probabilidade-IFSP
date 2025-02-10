# 3) Um programa de incentivo à amamentação exclusiva ao seio nos primeiros 3 meses
# está sendo executado em um hospital universitário. Verificou-se que a eficácia do
# programa era de π= 60%.
# Calcule a probabilidade para considerando entre 0 e 20 mães que deram à luz neste
# hospital e obtenha a distribuição de probabilidade da variável aleatória número de
# mães amamentando exclusivamente ao seio. Utilize o R para obter a tabela e o
# gráfico.

# Formula
# dbinom (x, tamanho, prob)

# 1) Separando Variaveis:
# probabilidade = 60% = 0.6
# probabilidade (x) = 0:20
# tamanho maximo (tamanho) = 20

x <- 0:20
n <- 20
p <- 0.6

probabilidade <- dbinom(x, n, p)
probabilidade

# Tabela
tabela_prob <- data.frame(x = x, probabilidade = probabilidade)
View(tabela_prob)

# Gráfico
library(ggplot2)
ggplot(tabela_prob, aes(x=x, y=probabilidade)) + 
  geom_col() +
  labs(title="Distribuição Binomial", x="Número de mães amamentando exclusivamente", y="Probabilidade")
