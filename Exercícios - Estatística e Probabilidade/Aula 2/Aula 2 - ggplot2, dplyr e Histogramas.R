#Instalando Bibliotecas
install.packages("dplyr")
install.packages("ggplot2")

#Importando Biblioteca
library(ggplot2)
library(dplyr)

#Criando Dataframe msleep
data(msleep)

#Traz o começo do Dataframe
head(msleep)

#Traz o final do Dataframe
dim(msleep)


summary(msleep)

#Selecionar Coluna usando "$"
msleep$sleep_total

#Calcula o Desvio de Padrão (Standard Deviation)
sd(msleep$sleep_total)

var(msleep$sleep_total)

quantile(msleep$sleep_total)

#Quantos animais dormem mais que 8 sum(msleep$sleep_total > 8)
sum(msleep$sleep_total > 8)

#Frequência relativa (proporção)
mean(msleep$sleep_total > 8)

#Para ignorar NA
mean(msleep$sleep_rem, na.rm = TRUE)

#Gráfico de dispersão
plot(msleep$sleep_total, msleep$sleep_rem)

#Com ggplot
ggplot(msleep, aes(x = sleep_total, y = sleep_rem)) +
  geom_point()

#Por grupos
ggplot(msleep, aes(brainwt, sleep_total)) +
  geom_point() +
  xlab("Peso do cérebro (log)") +
  ylab("Tempo de sono total") +
  scale_x_log10() +
  facet_wrap(~ vore)

#Boxplot
boxplot(sleep_total ~ vore, data = msleep)

#Com ggplot
ggplot(msleep, aes(vore, sleep_total)) +
  geom_boxplot()


#Histograma
hist(msleep$sleep_total)

#Com ggplot
ggplot(msleep, aes(sleep_total)) +
  geom_histogram()


#Com frequência relativa
ggplot(msleep) +
  geom_histogram(mapping=aes(x=sleep_total, y=..count../sum(..count..)*100), bins=20, fill="blue") +
  ggtitle("Tempo de sono total") +
  xlab("Sono total (hora)") +
  ylab("Frequência relativa")


#Dados categóricos
proportions(table(msleep$vore))

#Contagens
table(msleep$vore, msleep$conservation)

#Proporção por linha
proportions(table(msleep$vore, msleep$conservation), margin = 1)

#Proporção por coluna
proportions(table(msleep$vore, msleep$conservation),margin = 2)

#Convertendo para variáveis factor
msleep$vore <- factor(msleep$vore)
msleep$conservation <- factor(msleep$conservation)
summary(msleep)

#Gráfico de barras
barplot(table(msleep$vore))

#Com ggplot
ggplot(msleep, aes(vore)) +
  geom_bar()


#Barra horizontal
ggplot(msleep, aes(vore)) +
  geom_bar()+
  coord_flip()