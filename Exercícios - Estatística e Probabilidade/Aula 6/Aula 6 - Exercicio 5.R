# 5) 5. Um balde de 5 litros de água é retirado de um pântano. A água contém 75 larvas de
# mosquitos. Um balde de 200 ml de água é retirado do balde para mais análise. O que é:

# Formula
# ppois (q, lambda, lower.tail)

# Separando Variaveis:
# sucessos (q) = Exercicio
# lambda = Exercicio

# a) O número esperado de larvas no balão?
# Basicamente = 5L para 75 Larvas, então 5/25 = 0,2L ou 200ml, então 75/25 = 3 Larvas
N_larvas = 15000 / 5000 # 1 - 5000ml = 75 larvas e 200ml = x larvas // 2 - 5000x = 15000 // 3- x = 15000/5000
N_larvas

# b) A probabilidade de o frasco conter pelo menos uma lava de mosquito
zero_larvas <- dpois (0, 3)
zero_larvas

uma_larva <- 1 - zero_larvas
uma_larva