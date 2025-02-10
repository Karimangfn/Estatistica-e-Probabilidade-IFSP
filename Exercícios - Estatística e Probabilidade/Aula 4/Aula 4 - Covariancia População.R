library(dplyr)
library(ggplot2)

anos_serviço <-c(2,3,4,5,4,6,7,8,8,10)
num_clientes <-c(48,50,56,52,43,60,62,58,64,72)
serviço_clientes <- data.frame(anos_serviço, num_clientes)
mean(serviço_clientes$anos_serviço)
mean(serviço_clientes$num_clientes)

#Desvio padrão da amostra
sd(serviço_clientes$num_clientes)
#Para calcular o sd, cov e cor da população precisamos criar novas colunas e fazer os cálculos.
serviço_clientes['xxmedio']<-NA
serviço_clientes['yymedio']<-NA
#Calculando x-xmedio e y-ymedio
serviço_clientes$xxmedio<-anos_serviço - mean(serviço_clientes$anos_serviço)
serviço_clientes$yymedio<-num_clientes - mean(serviço_clientes$num_clientes)

#Calculando o desvio-padrão para a população n=10
serviço_clientes['xxmedio2']<-serviço_clientes$xxmedio^2
serviço_clientes['yymedio2']<-serviço_clientes$yymedio^2
#dpx<-sum(serviço_clientes$xxmedio2)/count(serviço_clientes$anos_serviço)
dpx<-sum(serviço_clientes$xxmedio2)/10

dpx<-sqrt(dpx)
dpy<-sum(serviço_clientes$yymedio2)/10
dpy<-sqrt(dpy)

serviço_clientes['covxy']<-(serviço_clientes$xxmedio)*(serviço_clientes$yymedio)
cov<-sum(serviço_clientes$covxy)/10

#Calculando o coeficiente de correlação
serviço_clientes['cor_xy']<-(serviço_clientes$xxmedio/dpx)*(serviço_clientes$yymedio/dpy)
cor<-sum(serviço_clientes$cor_xy)/10

#Gráfico
serviço_clientes%>%
  ggplot(aes(x = anos_serviço, y = num_clientes)) +
  geom_point(colour = "red")

#Reta ajustada - mínimos quadrados
serviço_clientes_model <- lm(num_clientes ~ anos_serviço, data = serviço_clientes)
serviço_clientes_model$coefficients
summary(serviço_clientes_model)

serviço_clientes%>%
  ggplot(aes(x = anos_serviço, y = num_clientes)) +
  geom_point(colour = "red") +
  geom_smooth(method = "lm", fill = NA)
