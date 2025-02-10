# Funções
#Funções fazem parte de um Pacote
a <- 5
b <- 3

c <- c(a,b) #Utilizamos a função "c"

#Para se ter definições pode se o usar o sinal "?" para acessar o Help

?c  #Aqui o Help ira nos da informações sobre a função "c"

a <- c(10, 20, 30)
a[1] #Retorna o valor da primeira posição na variavel "a", no caso o numero 10

#Função Summary, traz informações da variavel (media, mediana, class, etc)
?summary

summary(a)

#Usar função fora do pacote padrão
?str_c #Caso a função não existe, acessar rdocumentation.org

install.packages("stringr") #para Instalar o pacote

#Função Library, serve para carrega o pacote nessa seção
library(stringr)

#Função str_c, concatenando Strings
Nome <- "Fernando"
Sobrenome <- "Ferreira"

NomeCompleto <- str_c(Nome, " ", Sobrenome)
NomeCompleto
