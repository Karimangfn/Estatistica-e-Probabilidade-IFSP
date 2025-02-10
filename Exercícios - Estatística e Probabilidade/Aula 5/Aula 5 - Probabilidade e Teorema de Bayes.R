# Exercicio = Proposição
# Em um determinado bairro residencial, 60% de todos os lares assinam o jornal metropolitano
# publicado em uma cidade próxima, 80% assinam o jornal local e 50% de todos os lares assinam
# os dois. Se um lar for selecionado aleatoriamente, qual será a probabilidade de ele assinar:

# a) Ao menos um dos jornais
# b) Exatamente um dos dois jornais

# 1º Separar os valores, Jornal Metropolitano = P(A) = 60%, Jornal Local = P(B) = 80%, Jornal Metropolitano e Local = P(A∩B) = 50%

# 2º Transformar Porcentagens em valores (Dividir por 100):
# Jornal Metropolitano = P(A) = 0.60, Jornal Local = P(B) = 0.80, Jornal Metropolitano e Local = P(A∩B) = 0.50

# 3º P(AUB) = P(A) + P(B) - P(A∩B) = // P(Assinaturas de ao menos um dos jornais) = 0.60 + 0.80 - 0.50 = 0.90

###############################################################################

# Exercicio = Tecnicas de Contagem
# Há 10 assistentes de professores disponíveis para correção de provas em um determinado
# curso. O primeiro exame consiste em quatro questões e o professor deseja selecionar um
# assistente diferente para corrigir cada uma (apenas um assistente por questão). De quantas
# formas diferentes os assistentes podem ser escolhidos para a correção?

# 1º Definir numero de Assistentes (n = 10)

# 2º Definir numero de questões (k = 4)

# P4,10 = 10! / (10 - 4)! = 3.628.800 / 720 = 5040


###############################################################################

# Exercicio = Probabilidade Condicional
# 1)Suponha que, de todos os indivíduos que compram uma determinada câmera digital,
# 60% incluem um cartão de memória opcional na compra, 40% incluem uma pilha extra e
# 30% incluem um cartão e uma pilha. Considere a seleção aleatória de um comprador e
# sejam A = {compra de cartão de memória} e B = {compra de pilha }.

# a) Dado que o indivíduo selecionado comprou uma pilha extra, qual a probabilidade de compra de um cartão opcional?

# 1º Separar os valores, Cartão = 60% = P(A), Pilha = 40% = P(B), Cartão e Pilha = 30% = P(A∩B)

# 2º Transformar Porcentagens em valores (Dividir por 100): 
# Cartão = 0.60 = P(A), Pilha = 0.40 = P(B), Cartão e Pilha = 0.30 = P(A∩B)

# P(A|B) = P(A∩B) / P(B) = 0,30 / 0,40 = 0,75

# b) Calcular a probabilidade de, dado o comprador ter comprado um cartão, a probabilidade de ter comprado a pilha

# P(pilha/cartão de memória) = P(B|A) = P(A∩B) / P(A) = 0,30 / 0,60 = 0,50

###############################################################################

# Exercicio = Teorema de Bayes

# Incidência de doença rara: apenas 1 em 1.000 adultos é acometido por uma doença
# rara para a qual foi desenvolvido um teste de diagnóstico. O teste funciona de tal forma
# que, se o indivíduo tiver a doença, o resultado do teste será positivo em 99% das vezes
# e, se não a tiver, será positivo em apenas 2% das vezes. Se um indivíduo selecionado
# aleatoriamente for testado e o resultado for positivo, qual é a probabilidade de ele ter a
# doença?

# 1º Separar os valores, Individuo com Doença = P(A) = (1 a cada 1000) = 1/1000 = 0.001, 
# Individuo sem Doença = P(A´) = 0.999, Resultado do Teste positivo P(B|A) = 0,99
# Resultado do teste negativo = P(B|A´) = 0,02

# 2º Calcular o resultado do teste positivo:
# P(B) = P(B I A)*P(A) + P(B I A’)*P(A’) = 0,00099 + 0,01998 = 0,02097

# 3º Usar Teorema de Bayes
# P(A|B) = P(A∩B) / P(B) = 0,00099 / 0,02097 = 0 047