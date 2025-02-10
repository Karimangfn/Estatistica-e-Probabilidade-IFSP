#Funções

a <- c(100,200,300,400)

#Soma dos valores de "a"
x <- 0 
for (i in a) {
  x <- x + i
}
print(x)

b <- c(50,60,70,80)

#Soma dos valores de "b"
x <- 0 
for (i in b) {
  x <- x + i
}
print(x)

#Função para realizar somas 

soma <- function (y) {
  x <- 0
  for (i in y) {
    x <- x + i
  }
  print(x)
}

#Usando a função
soma(a)
soma(b)

#Função que recebe 2 parâmetros
soma2 <- function (y,z) {
  x <- 0
  c <- 0
  for (i in y) {
    c <- c + 1
    x <- z[c] + i
    print(x)
  }
}

soma2(a,b)
soma2(b,a)
