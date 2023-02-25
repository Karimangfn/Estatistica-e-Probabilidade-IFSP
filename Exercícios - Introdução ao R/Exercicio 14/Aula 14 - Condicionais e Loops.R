#Condicionais (if, else) e Loops (for, while)

#if
if (5 == 5) 6 + 6

#else
if (5 == 5) 6 + 6 else "condição não atendida"

#Melhores Praticas
if (5 != 5) {
  6 + 6
} else {
  "condição não atendida"
}

#Exemplo 
idades <- c(25,30)
nomes <- c("Amelia","João")
df <- data.frame(nomes,idades)

df$idades[df$nomes=="João"]

if (df$idades[df$nomes=="João"] > df$idades[df$nomes=="Amelia"]) {
  "Mais Velho: João"
} else {
  "Mais Velho: Amelia"
}

idades <- c(25,30,24,29,31,12)
nomes <- c("João", "Amelia", "Leticia", "Fernando", "Raito", "Luiz")
df <- data.frame(nomes,idades)

#for

for (i in idades) {
  print(i)
}

#Exemplo
v <- 0
for (i in df$idades) {
  if (i > v) {
    v <- i
  }
}
df$nomes[df$idades == v]

#while
x <- 0
while (x < 10) {
  print(x)
  x <- x + 1
}

#Exemplo - Não permitir que as somas das idades seja maior que 100
#y <- 0
x <- 0
cont <- 0
idades100 <- 0

while (x < 100) {
  cont <- cont + 1
  idades100[cont] <- idades[cont]
  x <- x + idades[cont]
  # y <- x + idades[cont]
}

#Idades
idades
idades100
sum(idades100)













