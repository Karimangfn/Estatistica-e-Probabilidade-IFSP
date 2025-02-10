# 3. Estudos anteriores mostraram quatro respostas possíveis a uma terapia com
# frequência: n1 = 0,50, n2 = 0,25, n3 = 0,10 e n4 = 0,15. Uma amostra aleatória de n =
# 200 produz n1 = 120, n2 = 60, n3 = 10 e n4 = 10. Em um nível de significância α =
# 0,05, a amostra aleatória confirma as frequências esperadas?

# Formula: 
# Teste qui-quadrado
# chisq.test(x = x,p = p / n)
# chisq.test(dados)

# Resposta
library(tidyr)
library(dplyr)
library(ggplot2)

observado <- c(120, 60, 10, 10)
n <- 200  
esperado <- c(.50, .25, .10, .15) * n
alpha <- .05
r <- c(1, 2, 3, 4)

data.frame(r, observado, esperado) %>%
  gather(key = "resposta", value = "freq", c(-r)) %>%
  ggplot() +
  geom_col(aes(x = r, y = freq, fill = resposta), position = "dodge") +
  labs(title = bquote("Frequência"),
       x = "Resposta a terapia",
       y = "Frequência") 


# Teste qui-quadrado = x²
(chisq.test.result <- chisq.test(x = observado,p = esperado / n))
