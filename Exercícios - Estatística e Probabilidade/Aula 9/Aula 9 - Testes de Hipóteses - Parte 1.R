# Que problemas podemos resolver? (Pagina 3)

# 1. Considere a quantidade de placa bacteriana antes e depois do tratamento.
# a) Faça o boxplot dos dados antes e depois do tratamento
# b) Construa o histograma para antes e depois.
# c) A distribuição é normal?
# d) Podemos afirmar que com IC=95% que há diferença na quantidade de placa bacteriana
# antes e depois?

#Criando a tabela

tab13_12<-data.frame(sujeito=1:26,rbind(
  c(2.18 , 0.43),c(2.05 , 0.08),c(1.05 , 0.18),c(1.95 , 0.78),c(0.28 , 0.03),
  c(2.63 , 0.23),c(1.5  , 0.2 ),c(0.45 , 0   ),c(0.7  , 0.05),c(1.3  , 0.3 ),
  c(1.25 , 0.33),c(0.18 , 0   ),c(3.3  , 0.9 ),c(1.4  , 0.24),c(0.9  , 0.15),
  c(0.58 , 0.1 ),c(2.5  , 0.33),c(2.25 , 0.33),c(1.53 , 0.53),c(1.43 , 0.43),
  c(3.48 , 0.65),c(1.8  , 0.2 ),c(1.5  , 0.25),c(2.55 , 0.15),c(1.3  , 0.05),
  c(2.65 , 0.25)))
names(tab13_12)[2:3]<-c("antes", "depois")

summary(tab13_12)

# a) Faça o boxplot dos dados antes e depois do tratamento
# Boxplot simples - opção
boxplot(tab13_12$antes,tab13_12$depois)

# Criando o boxplot para antes (x) e depois (y)
xp <- list(tab13_12$antes,tab13_12$depois)
boxplot(xp,pch="-", col="lightblue", border="black", boxwex=0.3, names=c("x","y"))

# b) Construa o histograma para antes e depois.
# Pistas para ver a distribuição
# Construindo histograma
hist(tab13_12$antes)  #Não aparenta estar normal
hist(tab13_12$depois) #Aparenta estar meio normal

# É normal quando os dados estão sobre a linha
qqnorm(tab13_12$antes) # Da para considerar normal
qqline(tab13_12$antes)
qqnorm(tab13_12$depois) # Da para considerar normal, embora alguns dados estejam fora
qqline(tab13_12$depois)

# Teste de normalidade: Shapiro-Wilk
# OBS: Todos os "tests" do R são algumacoisa.test, igual no shapiro.test
# p-value = usado para calcular com seu alfa, não indica nada

shapiro.test(tab13_12$antes) 
# p-value maior que 0.05 (0.07), então não é nula

shapiro.test(tab13_12$depois)
# p-value menor que 0.05 (0.01)

# Teste para variancia
var.test(x = tab13_12$antes,
         y = tab13_12$depois,
         ratio = 1, # ratio = 1 porque quero que eles sejam iguais
         alternative = "two.sided", # diferente = two.sided, maior = greater, menor = less
         conf.level = .95)
# Não são iguais

# Fazendo o teste t
t.test(tab13_12$antes,tab13_12$depois, 
       alternative="two.sided", # Foi perguntado na alternativa d) se tem diferença. por isso two.sided
       paired=TRUE, # Teste t = 1) pareado = usado com uma amostra (antes e depois), 2) não - pareado (independentes) = tem 2 amostras, Ex: comparar grupo de alunos de SP com o grupo de alunos de Guarulhos
       conf.level = 0.95)
# Tem diferença entre o antes e o depois

# c) A distribuição é normal?
# Resposta:
# A distribuição de antes do tratamento é normal, 
# A distribuição depois do tratamento pode ser considerada normal, embora alguns dados estejam
# fora da linha

# d) Podemos afirmar que com IC=95% que há diferença na quantidade de placa bacteriana
# antes e depois?
# Resposta: Sim, graças aos testes anteriores podemos afimar que a diferença entre antes e depois,
# pois o p-value descobrido ficou menor que no IC de 0.05