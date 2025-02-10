# 1) Seja Z uma variável aleatória normal e calcule as probabilidades a seguir, fazendo as
# ilustrações quando apropriado.

# Formula
# pnorm (q, média, sd, lower.tail) // Pois todas as altenativas são para Maior/Menor
# Quando é Distribuição Normal/Z o sd (desvio padrão) é sempre = 1
# a) Como é menor Igual lower.tail = True, ou não colocar
# b) Como é maior lower.tail = FALSE
# c) Como é menor igual, lower.tail = FALSE
# d) Neste caso como Z esta no meio e elas são menor, são uma subtraida da outra

# a. P(Z <= 1,25)
pnorm(q = 1.25, mean = 0, sd = 1, lower.tail = TRUE)

# b. P(Z > 1,25)
pnorm(q = 1.25, mean = 0, sd = 1, lower.tail = FALSE)

# c. P(Z <= -1,25)
pnorm(q = -1.25, mean = 0, sd = 1, lower.tail = TRUE)

# d. P(-0,38 <= Z <= 1,25)
pnorm(1.25) - pnorm(-0.38)

# Outro Exemplo:
# P(Z >= 1,5)

# 1 - pnorm(1.5)

# pnorm(q=1.5, mean = 0, sd = 1, lower.tail = FALSE)