library(ggplot2)
library(magrittr)

anos_serviço <-c(2,3,4,5,4,6,7,8,8,10)

num_clientes <-c(48,50,56,52,43,60,62,58,64,72)

serviço_clientes <- data.frame(anos_serviço, num_clientes)
View(serviço_clientes)

mean(serviço_clientes$anos_serviço)

mean(serviço_clientes$num_clientes)

sd(serviço_clientes$num_clientes)

#Calculando cov diretamente
cov(serviço_clientes$anos_serviço, serviço_clientes$num_clientes, method = "pearson")
cov(serviço_clientes$anos_serviço, serviço_clientes$num_clientes, method = "spearman")

#Calculando o coeficiente de correlação diretamente
cor(serviço_clientes$anos_serviço, serviço_clientes$num_clientes, method = "pearson")
cor(serviço_clientes$anos_serviço, serviço_clientes$num_clientes, method = "spearman")

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
