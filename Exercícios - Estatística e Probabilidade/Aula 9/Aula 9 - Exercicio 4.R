# 4. A hipótese de que uma população estudantil é de 60% de mulheres πF = 0,60. Uma
# amostra aleatória de n = 100 alunos produz 53% de mulheres pF = 0,53. A amostra é
# representativa da população em um nível de significância α = 0,05?

# Formula
# Teste qui-quadrado
# chisq.test(x = x,p = p / n)
# chisq.test(dados)

# Resposta

# Imports
library(tidyr)
library(dplyr)
library(ggplot2)

observado <- c(53, 47) # 53% Mulheres, 47% Homens
n <- 100  # Alunos Homens e Mulheres
esperado <- c(.60, .40) * n # 60% Mulheres, 40% Homens
alpha <- .05 # Alfa

# Gráfico
r <- c("feminino", "masculino")
data.frame(r, observado, esperado) %>%
  gather(key = "resposta", value = "freq", c(-r)) %>%
  ggplot() +
  geom_col(aes(x = r, y = freq, fill = resposta), position = "dodge") +
  labs(title = bquote("Frequência"), 
       x = "Gênero",
       y = "Frequência")


# Teste qui quadrado
chisq.test.result <- chisq.test(x = observado,p = esperado / n)
