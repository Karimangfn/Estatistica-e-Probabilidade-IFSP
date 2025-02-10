# 2) A probabilidade do pouso de um avião ser bem-sucedido usando um simulador de voo
# é dada por 0,70. Seis estudantes de pilotagem, escolhidos aleatória e
# independentemente, são convidados a tentar voar no avião, usando o simulador. Qual a
# probabilidade de dois dos seis estudantes pousarem com sucesso usando o simulador?

# Formula
# dbinom (x, tamanho, prob)

# 1) Separar as variaveis:
# prob = 0.70
# probabilidade de 2 (x) = 2 (2 em 6)
# Tamanho Total (tamanho) = 6 (6 estudantes)

# No R
dbinom(2, 6, 0.70)

# Existe 5.95% de probabilidade de que dois estudantes consigam
# realizar o pouso com sucesso.