# 3) Suponha que o diâmetro de certo tipo de árvores na altura do tronco tenha distribuição
# normal com média = 8,8 e desvio-padrão = 2,8

# Formula
# pnorm (q, média, sd, lower.tail)

# Separando Variaveis:
# media <- 8.8
# desvio_padrao <- 2.8

media <- 8.8
desvio_padrao <- 2.8

# a. Qual é a probabilidade de uma árvore selecionada aleatoriamente ter um diâmetro de
#no mínimo 10 polegadas? Exceder 10 polegadas?
minimo_10 <- pnorm(10, mean = media, sd = desvio_padrao, lower.tail = FALSE)
minimo_10

# De acordo com o exercicio da Prof esse esta errado
exceder_10 <- 1 - minimo_10
exceder_10

# Este esta certo
exceder_10 <- pnorm(11, mean = media, sd = desvio_padrao, lower.tail = FALSE)
exceder_10

#  b. Qual é a probabilidade de o diâmetro de uma árvore selecionada aleatoriamente
#exceder 20 polegadas?
exceder_20 <- pnorm(20, mean = media, sd = desvio_padrao, lower.tail = FALSE)
exceder_20

#  c. Qual é a probabilidade de o diâmetro de uma árvore selecionada aleatoriamente estar
#entre 5 e 10 polegadas?
probabilidade <- pnorm(10, mean = media, sd = desvio_padrao) - 
  pnorm(5, mean = media, sd = desvio_padrao)

probabilidade
