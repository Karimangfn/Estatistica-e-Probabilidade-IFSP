#Vetores - tipos de dados
numerico <- c(100, 10, 49)
caractere <- c("a", "b", "c")
string<-c("segunda","terça")
boolean <- c(TRUE, FALSE, TRUE)
numerico[1]
boolean[c(2,3)]

#Lista
a <- list(
  a = 1:3,
  b = "sextou",
  c = pi,
  d = list(-1, -5)
)
a

vet <- c(-24, -50, 100, -350, 10)
names(vet) <- c("segunda-feira", "terça-feira", "quarta-feira",
                "quinta-feira", "sexta-feira")
vet[1]

#Converter uma variável para factor()
status <- c("estudante", "não estudante", "estudante", "não
estudante")
estudante <- factor(status)
estudante
temperatura <- c("alta", "baixa", "alta","baixa", "media")
factor_temperatura <- factor(temperatura, order = TRUE, levels =
                               c("baixa", "media", "alta"))
temperatura

#Estrutura condicional
x <- 30
y <- 50
if (x > y) {
  print("x é maior")
} else {
  print("y é maior")
}

#Estrutura de repetição
valor <- c(16, 9, 13, 5, 2, 17, 14)
for(i in 3:length(valor)) {
  print(valor[i])
}

#DATAFRAMES
#O efeito da vitamina C no crescimento dos dentes em porquinhos-da-índia
data(ToothGrowth)
str(ToothGrowth)
View(ToothGrowth)
#calculando a media
mean(ToothGrowth$len)
sd(ToothGrowth$len)
head(ToothGrowth)
head(ToothGrowth, 10)
str(ToothGrowth)

#GRAFICO
library(ggplot2)

# scatter plot
ggplot(ToothGrowth, aes(x = len, y = dose, color = supp)) +
  geom_point(size = 4)

#histograma
ggplot(ToothGrowth, aes(x = len)) +
  geom_histogram()

#densidade
ggplot(ToothGrowth, aes(x = len)) +
  geom_density()

#violin
ToothGrowth$dose <- as.factor(ToothGrowth$dose)
ggplot(ToothGrowth, aes(x=dose, y=len)) +
  geom_violin() +
  coord_flip()

#violin separado por cores
ggplot(ToothGrowth, aes(x=dose, y=len, color=dose)) +
  geom_violin() +
  coord_flip()

#violin com pontos
ggplot(ToothGrowth, aes(x=dose, y=len, color=dose)) +
  geom_violin() +
  geom_dotplot(binaxis='y', stackdir='center', dotsize=1)
coord_flip()