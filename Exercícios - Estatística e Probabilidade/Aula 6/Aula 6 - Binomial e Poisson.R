# Funções para a distribuição Binomial no R

dbinom (x, tamanho, prob) # é a probabilidade de x sucessos em ensaios de tamanho
# quando a probabilidade de sucesso é prob.

pbinom (q, tamanho, prob, lower.tail) # é a probabilidade cumulativa (lower.tail = TRUE para
# a cauda esquerda (menor ou igual), lower.tail = FALSE para a cauda direita (maior))

rbinom (n, tamanho, prob) # retorna n números aleatórios da distribuição binomial x ~ b (n,prob).
# Obs.: pmf: probability mass function

###############################################################################

# Funções para a distribuição de Poisson no R

dpois (x, lambda) # é a probabilidade de x sucessos em um período em que o número
# esperado de eventos é lambda.

ppois (q, lambda, lower.tail) # é a probabilidade cumulativa (lower.tail = TRUE para a cauda
# esquerda (menor ou igual), lower.tail = FALSE para a cauda direita (maior)).

rpois (n, lambda) # retorna n números aleatórios da distribuição de Poisson x ~ P (lambda).

qpois (p, lambda, lower.tail) # retorna o valor (quantil) de uma probabilidade cumulativa
# específica (percentil) p.

###############################################################################

# Binomial (Está na Aula 3 - Exemplos resolvidos em R)

library(dplyr)
library(ggplot2)

#calcular a probabilidade e x = 8 procedimentos de angioplastia bem-sucedidos em n = 10 pacientes com estenose unilateral da artéria renal.
dbinom(x = 8, size = 10, prob = 0.7)

#simulando para n=10000
mean(rbinom(n = 10000, size = 10, prob = 0.7) == 8)

#Qual a probabilidade obter no máximo 8 sucessos em n = 10 pacientes?
pbinom(q = 8, size = 10, p = 0.7, lower.tail = TRUE)

#simulando para n=10000
mean(rbinom(n = 10000, size = 10, prob = 0.7) <= 8)

#Gráfico para x=8
data.frame(heads = 0:10, prob = dbinom(x = 0:10, size = 10, prob = 0.7)) %>%
  mutate(Sucessos = ifelse(heads == 8, "8", "outros")) %>%
  ggplot(aes(x = factor(heads), y = prob, fill = Sucessos)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,8), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Probabilidade of X = 8 successos.",
       subtitle = "b(10, .7)",
       x = "Successos (x)",
       y = "Probabilidade")


#Simulando para n=10000 e sucesso >=8
mean(rbinom(n = 10000, size = 10, prob = 0.7) >= 8)

###############################################################################

# Poisson (Está na Aula 3 - Exemplos resolvidos em R)

# Exercicio em baixo do gráfico
dpois(x = 135, lambda = 125)
