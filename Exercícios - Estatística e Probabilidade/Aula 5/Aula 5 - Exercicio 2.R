# 2. Suponha que tenhamos um teste para a gripe que classifica corretamente (positivo)
# 90% das vezes quando testado em um paciente com gripe (P (teste + | gripe) = 0,9).
# Considere também que este teste resulta negativo em 95% das vezes quando
# testado em uma pessoa saudável (P (teste - | sem gripe) = 0,95). Também sabemos
# que a gripe está afetando cerca de 1% da população (P (gripe) = 0,01). Você vai ao
# médico e tem um resultado positivo. Qual é a chance de você realmente ter gripe?

# Formula // Precisamos calcular a probabilidade de voce ter gripe, dando resultado positivo
# # P(A|B) = (P(B|A) * P(A)) / P(B) // Teorema de Bayes
# P(Gripe|teste+) = P(teste+|Gripe) * P(Gripe) / P(teste+)

# 1) Separar Valores:
# P(teste+|Gripe) 0.9, P(teste-|SemGripe) = 0.95, P(Gripe) = 0.01

# 2) Conta:
# P(Gripe|teste+) = P(teste+|Gripe) * P(Gripe) / P(teste+)
# P(Gripe|teste+) = 0.9 * 0.01 / P(teste+) // Calcular P(teste+)

# Calculo teste+
# Primeiro temos que descobrir quanto é um P(teste+|SemGripe)
# P(teste+|SemGripe) = 1 - P(teste-|SemGripe) = 1 - 0.95 = 0.05

# Segundo vamos calcular o P(SemGripe)
# P(SemGripe) = 1 - 0.01 = 0.99

# Terceiro Agora vamos calcular P(teste+)
# Ele vai ser a soma dos 2 resultados positivos
# P(teste+) = P(teste+|Gripe) * P(Gripe) + P(teste+|SemGripe) * P(SemGripe)
# P(teste+) = (0.9 * 0.01) + (0.05 * 0.99)
# P(teste+) = 0.009 + 0.04
# P(teste+) = 0,0585

# Agora vamos ao resultado
# P(Gripe|teste+) = P(teste+|Gripe) * P(Gripe) / P(teste+)
# P(Gripe|teste+) = (0.9 * 0.01) / 0.0585
# P(Gripe|teste+) = 0.009 / 0.0585
# P(Gripe|teste+) = 0,1538 ou 15,38%

# no R
flu <- sample(c('No','Yes'), size=100000, replace=TRUE, prob=c(0.99,0.01))
test <- rep(NA, 100000)
test[flu=='No'] <- sample(c('Neg','Pos'), size=sum(flu=='No'), replace=TRUE, prob=c(0.95,0.05))
test[flu=='Yes'] <- sample(c('Neg','Pos'), size=sum(flu=='Yes'), replace=TRUE, prob=c(0.1,0.9))
mean(flu[test=='Pos']=='Yes')
