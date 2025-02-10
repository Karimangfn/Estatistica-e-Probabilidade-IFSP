# 3. Considere a quantidade de placa bacteriana antes e depois do tratamento.

# Para construir a tabela (dataframe) no R use (copie e cole)

tabela <- data.frame(sujeito=1:26,rbind(
  c(2.18 , 0.43),c(2.05 , 0.08),c(1.05 , 0.18),c(1.95 , 0.78),c(0.28 , 0.03),
  c(2.63 , 0.23),c(1.5 ,  0.2 ),c(0.45 , 0 ),  c(0.7 ,  0.05),c(1.3 ,  0.3 ),
  c(1.25 , 0.33),c(0.18 , 0 ),  c(3.3 ,  0.9 ),c(1.4 ,  0.24),c(0.9 ,  0.15),
  c(0.58 , 0.1 ),c(2.5 ,  0.33),c(2.25 , 0.33),c(1.53 , 0.53),c(1.43 , 0.43),
  c(3.48 , 0.65),c(1.8 ,  0.2 ),c(1.5 ,  0.25),c(2.55 , 0.15),c(1.3 ,  0.05),
  c(2.65 , 0.25)))

names(tabela)[2:3]<-c("antes", "depois")


# a) Faça o boxplot dos dados antes e depois do tratamento
# Antes
ggplot(tabela, aes(antes)) +
  geom_boxplot()

# Depois
ggplot(tabela, aes(depois)) +
  geom_boxplot()

# b) Construa o histograma para antes e depois.
# Antes
ggplot(tabela, aes(antes)) +
  geom_histogram()

# Depois
ggplot(tabela, aes(depois)) +
  geom_histogram()

# c) A distribuição é normal?
# É normal quando os dados estão sobre a linha
qqnorm(tabela$antes) # Da para considerar normal
qqline(tabela$antes)
qqnorm(tabela$depois) # Da para considerar normal, embora alguns dados estejam fora
qqline(tabela$depois)

# Resposta:
# A distribuição de antes do tratamento é normal, 
# A distribuição depois do tratamento pode ser considerada normal, embora alguns dados estejam
# fora da linha

# d) Podemos afirmar que com IC=95% que há diferença na quantidade de placa bacteriana antes e depois?
# antes e depois?

#Teste de normalidade Shapiro-Wilk
shapiro.test(tabela$antes)
shapiro.test(tabela$depois)

# Teste para variância
var.test(x = tabela$antes, 
         y = tabela$depois, 
         ratio = 1, 
         alternative = "two.sided", 
         conf.level = .95)

# Fazendo o teste t
t.test(tabela$antes,tabela$depois, alternative="two.sided", paired=TRUE, conf.level = 0.95)

# Resposta: Sim, graças aos testes anteriores podemos afimar que a diferença entre antes e depois,
# pois o p-value descobrido ficou menor que no IC de 0.05