#Biblitecas
library(dplyr)
library(ggplot2)

#Lendo CSV
CSV <- read.csv("Aula 2 - 23.02.2023/SINASC_2020.csv", header = T, sep = ';')
View(CSV$IDADEMAE)

##############################################
# Origem

quantile(CSV$ORIGEM, na.rm = TRUE)

##############################################
# Idade_mãe -> Numerica continua

mean(CSV$IDADEMAE, na.rm = TRUE)

sd(CSV$IDADEMAE, na.rm = TRUE)

var(CSV$IDADEMAE, na.rm = TRUE)

quantile(CSV$IDADEMAE, na.rm = TRUE)

#Quantos Mães tem mais de 30 Anos
sum(CSV$IDADEMAE > 30, na.rm = TRUE)

#Frequência relativa (proporção)
mean(CSV$IDADEMAE, na.rm = TRUE)

#Mediana
median(CSV$IDADEMAE, na.rm = TRUE)

#Boxplot
boxplot(IDADEMAE ~ SEXO, data = CSV)

#Com ggplot
ggplot(CSV, aes(SEXO, IDADEMAE)) +
  geom_boxplot()

#Histograma
hist(CSV$IDADEMAE)

#Com ggplot
ggplot(CSV, aes(IDADEMAE)) +
  geom_histogram()

#Com frequência relativa
ggplot(CSV) +
  geom_histogram(mapping=aes(x=IDADEMAE, y=..count../sum(..count..)*100), bins=20, fill="blue") +
  ggtitle("Idade Mae") +
  ylab("Frequência relativa")


#Aula 4 - Covarianca e Retas
cov(CSV$IDADEMAE, CSV$SEXO, method = "spearman", use="complete.obs")
cor(CSV$IDADEMAE, CSV$SEXO, method = "pearson", use="complete.obs")

#Gráfico
CSV%>%
  #filter(CSV$SEXO==1)%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  #Criar a media da idade da mãe
  ggplot(aes(x = IDADEMAE, y = SEXO)) +
  geom_point(colour = "red")

#Reta ajustada - mínimos quadrados
Tabela_model <- lm(SEXO ~ IDADEMAE, data = CSV)
Tabela_model$coefficients
summary(Tabela_model)

CSV%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  ggplot(aes(x = SEXO, y = PESO)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)

##############################################
# Sexo -> Categorica nominal (Não fazer conta)
proportions(table(CSV$SEXO))

#Contagens
table(CSV$SEXO)

#Proporção por linha
proportions(table(CSV$SEXO), margin = 1)

#Convertendo para variáveis factor
CSV$SEXO <- factor(CSV$SEXO)
CSV$RACACOR <- factor(CSV$RACACOR)
summary(msleep)

#Gráfico de barras
barplot(table(CSV$SEXO))

#Com ggplot
ggplot(CSV, aes(SEXO)) +
  geom_bar()


#Barra horizontal
ggplot(CSV, aes(SEXO)) +
  geom_bar()+
  coord_flip()

#Aula 4 - Covarianca e Retas
cov(CSV$SEXO, CSV$PESO, method = "spearman", use="complete.obs")
cor(CSV$SEXO, CSV$PESO, method = "pearson", use="complete.obs")

#Gráfico
CSV%>%
  #filter(CSV$SEXO==2)%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  ggplot(aes(x = SEXO, y = PESO)) +
  geom_point(colour = "red")

#Reta ajustada - mínimos quadrados
Tabela_model <- lm(PESO ~ SEXO, data = CSV)
Tabela_model$coefficients
summary(Tabela_model)

CSV%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  ggplot(aes(x = SEXO, y = PESO)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)

##############################################
# raçacor -> Categorica nominal (Não fazer conta)

proportions(table(CSV$SEXO))

#Contagens
table(CSV$SEXO)

#Proporção por linha
proportions(table(CSV$SEXO), margin = 1)

#Convertendo para variáveis factor
CSV$SEXO <- factor(CSV$SEXO)
CSV$RACACOR <- factor(CSV$RACACOR)
summary(msleep)

#Gráfico de barras
barplot(table(CSV$SEXO))

#Com ggplot
ggplot(CSV, aes(SEXO)) +
  geom_bar()


#Barra horizontal
ggplot(CSV, aes(SEXO)) +
  geom_bar()+
  coord_flip()

##############################################
# peso -> Numerica continua

mean(CSV$PESO, na.rm = TRUE)

sd(CSV$PESO, na.rm = TRUE)

var(CSV$PESO, na.rm = TRUE)

quantile(CSV$PESO, na.rm = TRUE)

#Quantos tem o Peso maior que 3000
sum(CSV$PESO > 3000, na.rm = TRUE)

#Frequência relativa (proporção)
mean(CSV$PESO, na.rm = TRUE)

#Mediana
median(CSV$PESO, na.rm = TRUE)

#Boxplot
boxplot(PESO ~ IDADEMAE, data = CSV)

#Com ggplot
ggplot(CSV, aes(PESO, IDADEMAE)) +
  geom_boxplot()

#Histograma
hist(CSV$PESO)

#Com ggplot
ggplot(CSV, aes(PESO)) +
  geom_histogram()

#Com frequência relativa
ggplot(CSV) +
  geom_histogram(mapping=aes(x=PESO, y=..count../sum(..count..)*100), bins=20, fill="blue") +
  ggtitle("Peso") +
  ylab("Frequência relativa")


#Aula 4 - Covarianca e Retas
cov(CSV$IDADEMAE, CSV$PESO, method = "spearman", use="complete.obs")
cor(CSV$IDADEMAE, CSV$PESO, method = "pearson", use="complete.obs")

#Gráfico
CSV%>%
  #filter(CSV$SEXO==1)%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  #Criar a media da idade da mãe
  ggplot(aes(x = IDADEMAE, y = PESO)) +
  geom_point(colour = "red")

#Reta ajustada - mínimos quadrados
Tabela_model <- lm(PESO ~ IDADEMAE, data = CSV)
Tabela_model$coefficients
summary(Tabela_model)

CSV%>%
  sample_n(10000)%>% #Limitar a base com sample "Amostra"
  ggplot(aes(x = IDADEMAE, y = PESO)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)

##############################################
# Para calcular sexo e racacor por serem categoricas converter elas para factor(), Olhar #Dados categóricos
