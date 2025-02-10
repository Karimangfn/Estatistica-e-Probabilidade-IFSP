# 1.Em uma pesquisa sobre a relação da prática de atividade física no colesterol total de
# indivíduos saudáveis, o que se pode afirmar sobre as populações investigadas com os dados
# amostrais a seguir?

# Formula
# IC(u) = ~x - t * (s / Raiz de n) // Calculo Negativo
# IC(u) = ~x + t * (s / Raiz de n) // Calculo Positivo

# Separar Variaveis
# ~x (Média) = 200, 209 
# t = 1.96 (Constante) ou z_star_95 <- qnorm(0.975)
# s (desvio padrão) = 4.93, 4.95
# n (tamanho da amostra) = 100, 100

# Podemos encontrar o valor crítico para um intervalo de confiança de 95% usando
z_star_95 <- qnorm(0.975)

# pratica atividade física
menor_p = (200) - z_star_95 * (4.93/ sqrt(100))
maior_p = (200) + z_star_95 * (4.93/ sqrt(100))

# não pratica
menor_n = (209.8) - z_star_95 * (4.95/ sqrt(100))
maior_n = (209.8) + z_star_95 * (4.95/ sqrt(100))

# R.: Como não há superposição dos intervalos de confiança, conclui-se que o nível de colesterol
# total está relacionado à prática atividade física: quem não pratica atividade física tem maior
# colesterol quando comparado a quem pratica.


# desvio-padrão = raiz da variancia
# erro-padrão = desvio-padrão/ raiz n = 4,93 / raiz de 100 = 0,49

# quando um intervalo fica e cima do outro tem superposição
# e como não tem eles não tem relação


