# Exercicio pagina 4
# a)
pnorm(0.32) # só funciona quando de calcula do começo (menor que infinito) até o valor
pnorm(q = 0.32, mean = 0, sd = 1, lower.tail = TRUE) # esse aqui é para todos

# b) com o R podemos calcular os valores negativos
pnorm(0) - pnorm(-1.32)

# c) quando se tem o sinal de maior, se usa lower.tail = FALSE
1 - pnorm(1.5) #o "1" é a probabilidade do todo, então fica 1 - maior 1.5
pnorm(q = 1.5, mean = 0, sd = 1, lower.tail = FALSE) # Lembrar do Lower.Tail false para valores do lado direito

# d) o R ja calcula valores negativos
pnorm(-1.3)

# e)
pnorm(1.5) - pnorm(-1.5)

###############################################################################

# Exemplo pagina 5
# a)
pnorm(q = 100, mean = 120, sd = 15, lower.tail = TRUE)

# b) Nesse exercicio ja que temos o A = 0,95 vamos procurar na tabela qual valor de 
# Z se aproxima mais de 0.95, não precisa ser exato, apenas aproximado
# vamos o "q" no R quando queremos achar o valor de x
qnorm(0.95, 120, 15, TRUE) 

# c) o gráfico não cai na prova
tempo <- seq(from=0, to=300, by=0.5)
dens <- dnorm(tempo, mean=120, sd=15)

plot(tempo, dens, type = "l",
     main = "Distribuição normal para X: Média=120, sd=15)",
     xlab = "x", ylab = "FDP",las=1) +
  abline(v=120)

acumulada <- pnorm(tempo, mean=120, sd=15)
plot(tempo, acumulada, type = "l",
     main = "Distribuição normal para X: Média=120, sd=15)",
     xlab = "x", ylab = "FDA",las=1) +
  abline(v=120)