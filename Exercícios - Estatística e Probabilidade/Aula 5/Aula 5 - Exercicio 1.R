#1. Considere o caso em que uma pessoa idosa (com mais de 80 anos) cai. Qual é a
#probabilidade de ocorrer a morte dessa pessoa no outono?

#Vamos supor que a taxa básica de idosos morrendo P(A) seja de 10%, e a taxa básica
#para idosos que caem P(B) seja de 5%. Considere também que, de todos os idosos, 7%
# daqueles que morreram tiveram queda.

# Formula
# P(A|B) = (P(B|A) * P(A)) / P(B) // Teorema de Bayes

# 1) Separar valores:
# P(A) = 0.1, P(B) = 0.05, P(A∩B) = 0.07

# 2) Conta: 
# P(A|B) = (P(B|A) * P(A)) / P(B) // Teorema de Bayes
# P(A|B) = 0.07 * 0.1 / 0.05
# P(A|B) = 0.14

# No R
bayes_theorem <- function(p_a, p_b, p_b_given_a) {
  p_a_given_b = (p_b_given_a * p_a) / p_b
  return(p_a_given_b)
}
p_a = 0.10
p_b = 0.05
p_b_given_a = 0.07
bayes_theorem(p_a, p_b, p_b_given_a)
