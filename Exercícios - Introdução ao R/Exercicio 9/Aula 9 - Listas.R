#Lista - Vetor com tipos de dados diferentes
a <- c(1,2,3,4,5)
b <- c(1,"2","3",4,5)

#Função as.numeric, transforma todo o conteudo da variavel em numerico
b <- as.numeric(b)

#Função is.list, identificar se a variavel é uma lista
is.list(a)
is.list(b)

is.vector(a)
is.vector(b)

#Função list, serve para criar uma lista
b <- list(10,"2",8)
mode(b)
is.list(b)
str(b)

e <- list(c(1,2,3,4,5), "2", 8)
str(e)
e[[1]][3]