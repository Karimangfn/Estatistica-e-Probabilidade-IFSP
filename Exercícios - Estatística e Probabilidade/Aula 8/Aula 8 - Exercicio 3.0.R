# 3. Uma pesquisa investigou 100 indivíduos, sendo 50 do grupo doente e 50 do grupo controle. A
# proporção (porcentagem) de fadiga, segundo determinada escala validada para a população
# estudada, foi medida e comparada entre os grupos. No grupo doente houveram 35 pacientes
# com fadiga. No grupo controle houveram 15 pacientes com fadiga.
# Como seria o intervalo para cada uma das proporções consideradas?
# Faça o código em R.

# Formula
# IC(p) = ~p - c * (Raiz de ~p(1 - ~p) / n) // Calculo Negativo
# IC(p) = ~p + c * (Raiz de ~p(1 - ~p) / n) // Calculo Positivo

# Separar Variaveis:
# n (Total da amostra) = 50 (doente), 50 (controle)
# ~p = ??

# 1) Calcular proporção amostral (~p): Basta dividir o número de casos de interesse pelo tamanho da amostra:
grupo_doente_amostra <- 50
grupo_doente_fadiga <- 35
proporcao_amostral_doente <- grupo_doente_fadiga / grupo_doente_amostra
proporcao_amostral_doente

grupo_controle_amostra <- 50
grupo_controle_fadiga <- 15
proporcao_amostral_controle <- grupo_controle_fadiga / grupo_controle_amostra
proporcao_amostral_controle

# 2) Nivel de confiança (c): 95% = 0,95
valor_critico <- qnorm(0.975)

# 3) Calcular erro padrão
# Formula Raiz de (~p * (1 - ~p) / n) // A parte do lado da formula = (Raiz de ~p(1 - ~p) / n)
erro_padrao_doente <- sqrt((proporcao_amostral_doente * 
                              (1 - proporcao_amostral_doente)) / grupo_doente_amostra)
erro_padrao_controle <- sqrt((proporcao_amostral_controle * 
                                (1 - proporcao_amostral_controle)) / grupo_controle_amostra)


# Doente
IC_doente <- c(proporcao_amostral_doente - valor_critico * erro_padrao_doente, proporcao_amostral_doente + valor_critico * erro_padrao_doente)
IC_doente

# Controle
IC_controle <- c(proporcao_amostral_controle - valor_critico * erro_padrao_controle, proporcao_amostral_controle + valor_critico * erro_padrao_controle)
IC_controle
# 3. Uma pesquisa investigou 100 indivíduos, sendo 50 do grupo doente e 50 do grupo controle. A
# proporção (porcentagem) de fadiga, segundo determinada escala validada para a população
# estudada, foi medida e comparada entre os grupos. No grupo doente houveram 35 pacientes
# com fadiga. No grupo controle houveram 15 pacientes com fadiga.
# Como seria o intervalo para cada uma das proporções consideradas?
# Faça o código em R.

# Formula
# IC(p) = ~p - c * (Raiz de ~p(1 - ~p) / n) // Calculo Negativo
# IC(p) = ~p + c * (Raiz de ~p(1 - ~p) / n) // Calculo Positivo

# Separar Variaveis:
# n (Total da amostra) = 50 (doente), 50 (controle)
# ~p = ??

# 1) Calcular proporção amostral (~p): Basta dividir o número de casos de interesse pelo tamanho da amostra:
grupo_doente_amostra <- 50
grupo_doente_fadiga <- 35
proporcao_amostral_doente <- grupo_doente_fadiga / grupo_doente_amostra
proporcao_amostral_doente

grupo_controle_amostra <- 50
grupo_controle_fadiga <- 15
proporcao_amostral_controle <- grupo_controle_fadiga / grupo_controle_amostra
proporcao_amostral_controle

# 2) Nivel de confiança (c): 95% = 0,95
valor_critico <- qnorm(0.975)

# 3) Calcular erro padrão
# Formula Raiz de (~p * (1 - ~p) / n) // A parte do lado da formula = (Raiz de ~p(1 - ~p) / n)
erro_padrao_doente <- sqrt((proporcao_amostral_doente * 
                              (1 - proporcao_amostral_doente)) / grupo_doente_amostra)
erro_padrao_controle <- sqrt((proporcao_amostral_controle * 
                                (1 - proporcao_amostral_controle)) / grupo_controle_amostra)


# Doente
IC_doente <- c(proporcao_amostral_doente - valor_critico * erro_padrao_doente, proporcao_amostral_doente + valor_critico * erro_padrao_doente)
IC_doente

# Controle
IC_controle <- c(proporcao_amostral_controle - valor_critico * erro_padrao_controle, proporcao_amostral_controle + valor_critico * erro_padrao_controle)
IC_controle
