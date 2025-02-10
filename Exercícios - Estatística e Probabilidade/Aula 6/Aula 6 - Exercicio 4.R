# 4) Suponha que o número médio de acidentes com fogos de artifício ocorridos por
# ano em uma cidade é de 5 por 100.000 habitantes. Determinar a probabilidade de
# em uma cidade de 200.000 habitantes haver:

# Formula
# dpois (x, lambda)

# 1) Separando Variaveis:
# Sucessos (x) = depende da alternativa, a) = 0, b) = 2, c > 2
# Lambda = 10 (5 por 100.000, então 10 por 200.000)

# a. zero acidentes
zero_acidentes <- dpois (0, 10)
zero_acidentes

# b. dois acidentes
dois_acidentes <- dpois(2, 10)
dois_acidentes

# c. mais de dois acidentes
# Com dpois
zero_acidentes <- dpois (0, 10)
um_acidente <- dpois (1, 10)
dois_acidentes <- dpois(2, 10)

maximo_dois = zero_acidentes + um_acidente + dois_acidentes
maximo_dois

mais_de_dois <- 1 - maximo_dois
mais_de_dois

# Com ppois (Mais de dois = lower.tail = FALSE)
ppois(2, 10, lower.tail = FALSE)
