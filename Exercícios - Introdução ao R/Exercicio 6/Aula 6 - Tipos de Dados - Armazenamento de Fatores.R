#Armazenamento de Fatores

CargaHoraria <- c(220,220,150,100,100)
summary(CargaHoraria)

#Função as.factor, transforma o tipo da variavel para factor (quantas vezes cada numero ou caracter aparece)
CargaHoraria <- as.factor(CargaHoraria)
summary(CargaHoraria)

CargaHoraria <- as.factor(c(220,220,150,100,100))
summary(CargaHoraria)

#Função mode, Verifica o modo de armazenamento
mode(CargaHoraria)

#Função class, Verifica o tipo de armazenamento
class(CargaHoraria)

