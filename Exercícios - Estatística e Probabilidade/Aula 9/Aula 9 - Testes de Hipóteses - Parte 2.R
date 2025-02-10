# Comparação entre proporções (Pagina 4)

# 2. Em um experimento sobre a eficácia de um tratamento, nx = 125 pacientes foram
# designados para o tratamento novo e ny = 175 para o tratamento tradicional.
# Considerando que x = 94 (75,2%) dos pacientes submetidos ao novo tratamento
# apresentaram melhora e y = 113 (64,6%) dos pacientes submetidos ao tratamento
# tradicional apresentaram melhoras. Em um nível de significância α = 0,05, o novo
# tratamento produz taxas de sucesso mais altas do que o tratamento tradicional? Qual é
# o intervalo de confiança a 95% da diferença nas taxas de sucesso?

library(stats)
library(dplyr)
library(ggplot2)

# Formula
# prop.test.result <- prop.test(x = c(x, y),n = c(nx, ny), 
#                               alternative = "greater", 
#                               conf.level = 1 - alpha, 
#                               correct = FALSE)

prop.test.result <- prop.test(x = c(94, 113),n = c(125, 175), 
                              alternative = "greater", # É greater pois no exercicio a pergunta é se é maior
                              conf.level = 1 - 0.05, 
                              correct = FALSE) # Esta FALSE pois não iremos fazer uma correção
prop.test.result
# Resposta: É Maior porque, não deu diferente (é menor que 0.05)


# Gráfico do teste de hipótese com o intervalo de rejeição em vermelho
# OBS: Não cai na prova

# Formula
# p <- (x + y) / (nx + ny))
# se <- sqrt(p * (1 - p) * (1 / nx + 1 / ny))


p <- (94 + 113)/(125 + 175)
se <- sqrt(p * (1 - p) * (1 / 125 + 1 / 175))

lrr = -Inf
urr = qnorm(p = 0.05, mean = 0, sd = se, lower.tail = FALSE)
data.frame(d = -300:300 / 1000) %>%
  mutate(density = dnorm(x = d, mean = 0, sd = se)) %>%
  mutate(rr = ifelse(d < lrr | d > urr, density, 0)) %>%
  ggplot() +
  geom_line(aes(x = d, y = density)) +
  geom_area(aes(x = d, y = rr, fill = "red"), alpha = 0.3) +
  geom_vline(aes(xintercept = 0.752 - 0.646), color = "blue") +
  geom_vline(aes(xintercept = 0), color = "black") +
  labs(title = bquote("Teste de hipótese para diferenças entre proporções"),
       x = "d",
       y = "Density") +
  theme(legend.position="none")


# Como calcular para que os resultados sejam diferentes (bilateral)?
prop.test.result <- prop.test(x = c(94, 113),n = c(125, 175),
                              alternative = "two.sided",
                              conf.level = 1 - 0.05, 
                              correct = FALSE)
prop.test.result
# Resposta: Rejeita a hipotese nula, pois o resultado é menor que 0.05, porém esta bem proximo


# Gráfico para bilateral
lcl <- round(prop.test.result$conf.int[1], 3)
ucl <- round(prop.test.result$conf.int[2], 3)
data.frame(d = -300:300 / 1000) %>%
  mutate(density = dnorm(x = d, mean = 0.752 - 0.646, sd = se)) %>%
  mutate(rr = ifelse(d < lcl | d > ucl, density, 0)) %>%
  ggplot() +
  geom_line(aes(x = d, y = density)) +
  geom_area(aes(x = d, y = rr), fill = "red", alpha = 0.3) +
  geom_vline(aes(xintercept = 0.752 - 0.646), color = "blue") +
  labs(title = bquote("Diferença entre proporções bilateral"),
       x = "d",
       y = "Densidade") +
  theme(legend.position="none")
