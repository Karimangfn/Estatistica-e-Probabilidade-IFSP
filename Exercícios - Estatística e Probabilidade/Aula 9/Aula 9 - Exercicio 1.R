# 1. Um estudo de 15 pares de gêmeos em que um dos gêmeos teve esquizofrenia
# mediu o volume de regiões do cérebro. Qual é a magnitude da diferença de volume?

# Hipótese nula H0 = 0.

# Hipótese alternativa = diferente de 0 (bilateral)

# Formulas
## Teste t (quando queremos comparar duas amostras numericas)
# t.test(x, y,
#      alternative="two.sided",
#      paired=TRUE, # Tem que ser True pois é usado apenas uma amostra
#      conf.level = 0.95) # IC de 95%

## Teste Shapiro
# shapiro.test(x)
# shapiro.test(y)

## Teste F // var
# var.test(x = x, 
#          y = y, 
#          ratio = 1, 
#          alternative = "two.sided", 
#          conf.level = .95)

# Passo a Passo para Resolver
# 1) verificar distribuição normal (shapiro.test)
# 2) verificar variancias (var.test)
# 3) Fazer o teste t
# obs: p-value > alfa (0.05) = é normal
# obs2: Teste t pareado = true: 1 amostra, teste antes/depois // não-pareado: 2 amostras
# obs3: gemeos = pareado = True

# Usar os dados:
x <- c(1.94, 1.44, 1.56, 1.58, 2.06, 1.66, 1.75, 1.77, 1.78, 1.92,
       1.25, 1.93, 2.04, 1.62, 2.08)
y <- c(1.27, 1.63, 1.47, 1.39, 1.93, 1.26, 1.71, 1.67, 1.28, 1.85,
       1.02, 1.34, 2.02, 1.59, 1.97)

# Resposta:
# 1) Graficos
#Q-Q plot
qqnorm(x)
qqline(x)


qqnorm(y)
qqline(y)

# 2) Teste de Normalidade / Shapiro
shapiro.test(x)
shapiro.test(y)

# 3) Teste F para comparar as variâncias
r_0 = 1
var.test(x = x, 
         y = y, 
         ratio = 1, 
         alternative = "two.sided", 
         conf.level = .95)


# 4) Fazer com o teste t de Student, pois são duas amostras que queremos comparar
# Fazendo o teste t
t.test(x, y, # Amostras
       alternative="two.sided", # two sided pois queremos saber a diferença
       paired=TRUE, # Tem que ser True pois é usado apenas uma amostra
       conf.level = 0.95) # IC de 95%

# Hipotese Alternativa