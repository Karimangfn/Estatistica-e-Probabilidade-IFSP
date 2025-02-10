# 2. Se a média de IMC (Kg/m2) de uma determinada amostra de tamanho 30 é 25,4 kg/m2 e o
# desvio-padrão é 6,0 kg/m2. O que se pode afirmar sobre o IMC médio da população (μ) a um
# nível de 95% de confiança? Supondo o desvio padrão populacional desconhecido, calcule o IC.

# Formula
# IC(u) = ~x - t * (s / Raiz de n) // Calculo Negativo
# IC(u) = ~x + t * (s / Raiz de n) // Calculo Positivo

# Separação de Variaveis:
# n (tamanho da amostra) = 30
# média (~x) = 25.4
# sd (desvio padrão) = 6
# c  = 1.96 (Constante) ou z_star_95 <- qnorm(0.975)

## Observações
# Amostra pequena = usar t de student
# d = valor, p = acumulada, q = percentil, t = t de student

# Podemos encontrar o valor crítico para um intervalo de confiança de 95% usando
# Distribuição t de Student - n = grau de liberdade; usar n-1
z_star_95 <- qt(0.975, 29)

# menor = media - z_star_95 * (sd() / sqrt(n)),
# maior = media + z_star_95 * (sd() / sqrt(n)))

menor = 25.4 - z_star_95 * (6 / sqrt(30))
maior = 25.4 + z_star_95 * (6 / sqrt(30))

# Isso significa que podemos ter 95% de confiança de que a média do IMC da população 
# está dentro desse intervalo.