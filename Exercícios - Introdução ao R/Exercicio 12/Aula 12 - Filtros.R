#Filtros - Acessar, Extrair e Modificar dados em variaveis

#Criando uma variavel
vogais <- c("a","e","i","o","u")

#Acessar o conteudo na posição 3
vogais[3]

#Acessar tudo menos a posição 3
vogais[-3]

#Acessar dados entre a posição 3 e 5
vogais[3:5]

#Dados considerando o comprimento
length(vogais)
vogais[3:length(vogais)]
vogais[(length(vogais)-2):length(vogais)]

#Dados considerando outras variaveis
a <- 3
b <- 5
vogais[a:b]

#Acessar através de condições
vogais[vogais=="e"]
vogais[vogais!="e"]

a <- c(1,2,3,4,5)
a[a>2]
a[a>=2]
