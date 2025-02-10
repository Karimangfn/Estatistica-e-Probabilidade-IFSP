#3)
df_tipo1 <- data.frame(MPa = c(350, 350, 350, 358, 370, 370, 370, 371, 
                               371, 372, 372, 384, 391, 391, 392))

df_tipo2 <- data.frame(MPa = c(350, 354, 359, 363, 365, 368, 369, 371, 
                               373, 374, 376, 380, 383, 388, 392))

df_tipo3 <- data.frame(MPa = c(350, 361, 362, 364, 364, 365, 366, 371,
                               377, 377, 377, 379, 380, 380, 392))


#a) Construa um boxplot comparativo e comente as semelhanças e diferenças
library(ggplot2)

ggplot(df_tipo1, aes(MPa)) + geom_boxplot()

ggplot(df_tipo2, aes(MPa)) + geom_boxplot()

ggplot(df_tipo3, aes(MPa)) + geom_boxplot()

#Os 3 boxspots são identicos

#b) Construa um gráfico de pontos (dotplot) comparativo (um dotplot para cada amostra com uma escala comum). Comente as semelhanças e diferenças.
library(ggplot2)

ggplot(df_tipo1, aes(MPa)) + geom_dotplot()

ggplot(df_tipo2, aes(MPa)) + geom_dotplot()

ggplot(df_tipo3, aes(MPa)) + geom_dotplot()