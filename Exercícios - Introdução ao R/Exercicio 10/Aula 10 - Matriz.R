#Matrizes - Duas dimensões de um tipo de dado

#Função matrix, cria uma matriz
m <- matrix(1:9, nrow = 3)
mode(m)
class(m)

#Acessar dados na Matriz, indicar linha e coluna
m[1,3]
m[1,3] <- "a"