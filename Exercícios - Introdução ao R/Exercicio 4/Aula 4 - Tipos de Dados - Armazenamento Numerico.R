#Armazenamento Numerico
Salario <- 3450.20
Horas <- 220

SH <- Salario/Horas

#Função as.integer, traz o valor inteiro do resultado, mas não arredonda
SHi <- as.integer(Salario/Horas)

#Função round, para arredondar o resultado
SHr <- round(Salario/Horas)