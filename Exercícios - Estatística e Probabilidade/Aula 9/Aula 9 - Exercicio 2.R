# 2. Um técnico de atletismo testa a hipótese de que a velocidade máxima atingida pelo
# atleta 1 em 10 tentativas é maior que pelo atleta 2. Considerando um nível de
# significância de α = 0,05, o atleta 1 é realmente mais rápido?

# A hipótese nula é que H0 : d = média1 - média2 = 0.

# Hipótese alternativa: atleta 2 é melhor Ha: d > 0 (nível de significância α=0.05)

# Formula
## Teste t (quando queremos comparar duas amostras numericas)
# t.test(x, y,
#      alternative="two.sided",
#      paired=TRUE, # Tem que ser True pois é usado apenas uma amostra
#      conf.level = 0.95) # IC de 95%

## Teste Shapiro // Normalidade
# shapiro.test(x)
# shapiro.test(y)
# Sendo:
# x, y = Amostras

## Teste F // var (variancia)
# var.test(x = x, 
#          y = y, 
#          ratio = 1, 
#          alternative = "two.sided", 
#          conf.level = .95)

# Usar os dados:
atl1<-c(42.1, 41, 41.3, 41.8, 42.4, 42.8, 43.2, 42.3, 41.8, 42.7)
atl2<-c(42.7, 43.6, 43.8, 43.3, 42.5, 43.5, 43.1, 41.7, 44, 44.1)

# Resposta
d_0 = 0
alpha = 0.05

# Amostras são normais?
par(mfrow=c(1,2))
qqnorm(atl2)
qqline(atl2)
qqnorm(atl1)
qqline(atl1)


shapiro.test(atl1)
shapiro.test(atl2)


# Vamos verificar se há diferenças entre as variâncias. Para esse caso 
# H0: r = (sd_atl1)*(sd_atl1) / (sd_atl2)*(sd_atl2) = 1.


sd_1 = sd(atl1)
sd_2 = sd(atl2)


alpha = 0.05
var.test(x = atl1, 
         y = atl2, 
         ratio = 1, 
         alternative = "two.sided", 
         conf.level = .95)
# Aceitamos a hipótese nula para a variância


# Comparando as médias
# Perguntando se a valocidade media do atleta 2 é maior que a do atleta 1
(t.test.result <- t.test(x = atl1, 
                         y = atl2, 
                         alternative = "greater", 
                         mu = 0, 
                         paired = FALSE, 
                         var.equal = TRUE, 
                         conf.level = (1 - alpha)))
# Aceitamos a hipótese nula




# O atleta 2 é mais rápido que o atleta 1
(t.test.result <- t.test(x = atl1, 
                         y = atl2, 
                         alternative = "less", 
                         mu = 0, 
                         paired = FALSE, 
                         var.equal = TRUE, 
                         conf.level = (1 - alpha)))




# O gráfico do teste de hipóteses mostra que a diferença medida nas médias está dentro da faixa de rejeição.
n_2 <- 10
n_1 <- 10

# Variação combinada
s_p2 <- ((n_1 - 1) * sd_1^2 + (n_2 - 1) * sd_2^2) / (n_1 + n_2 - 2)

# Variação da distribuição amostral da diferença medida
se_2 <- s_p2 * (1 / n_2 + 1 / n_1)

# Variância combinada para a diferença das médias
d_hat <- mean(atl1) - mean(atl2)
t <- (d_hat - d_0) / sqrt(se_2)

# Gráfico
t_crit = qt(p = alpha, df = n_2 + n_1 - 2)
lrr <- d_0 - t_crit * sqrt(se_2)
urr <- Inf
data.frame(d = -250:250 / 100) %>%
  mutate(t = (d - d_0) / sqrt(se_2)) %>%
  mutate(prob = dt(x = t, df = n_2 + n_1 - 2)) %>%
  mutate(rr = ifelse(t < t_crit, prob, 0)) %>%
  ggplot() +
  geom_line(aes(x = d, y = prob)) +
  geom_area(aes(x = d, y = rr), fill = "red", alpha = 0.3) +
  geom_vline(aes(xintercept = d_0), color = "blue") +
  geom_vline(aes(xintercept = d_hat), color = "red") +
  labs(title = bquote("Teste de hipótese de H0: d = 0"),
       x = "d",
       y = "Probabilidade") +
  theme(legend.position="none")
