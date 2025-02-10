# CSV Caminho
Caminho_csv <- "INFLUD13.csv"

# Leitura de CSV
INFLUD13 <- read.csv2(Caminho_csv)

# ============================================================================================================
# ANÁLISE DE SINTOMAS

# Carregar pacote necessário
library(ggplot2)

# ============================================================================================================
# PRIMEIRA ANÁLISE
# Relação entre os sintomas (febre, tosse e dor de garganta) e a Raça/Cor

# Definindo amostras (1000)
n_amostras <- 1000

# Selecionando aleatoriamente 1000 observações do dataframe
amostras <- sample(nrow(INFLUD13), n_amostras)

# Removendo NAs apenas das variáveis relevantes nas amostras selecionadas
dados_filtrados <- INFLUD13[amostras, ]
dados_filtrados <- dados_filtrados[!is.na(dados_filtrados$FEBRE) & 
                                   !is.na(dados_filtrados$TOSSE) & 
                                   !is.na(dados_filtrados$GARGANTA) & 
                                   !is.na(dados_filtrados$DT_SIN_PRI), ]

# Criando a tabela de frequência dos sintomas para cada data nas amostras selecionadas
tab_sintomas_data <- with(dados_filtrados, table(FEBRE, TOSSE, GARGANTA, CS_RACA))

# Calculando as proporções de casos
proporcoes <- prop.table(tab_sintomas_data)

# Visualizando as proporções
proporcoes

# Criação do Gráfico de Barras
# Transformando as proporções em um dataframe
prop_df <- as.data.frame(proporcoes)

# Criando o gráfico de barras
ggplot(prop_df, aes(x = CS_RACA, y = Freq, fill = interaction(FEBRE, TOSSE, GARGANTA))) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Raça", y = "Proporção", fill = "Sintomas") +
  theme_minimal()


# ============================================================================================================
# SEGUNDA ANÁLISE
# Relação entre os sintomas (febre, tosse e dor de garganta) e Sexo

# Definindo amostras (1000)
n_amostras <- 1000

# Selecionando aleatoriamente 1000 observações do dataframe
amostras <- sample(nrow(INFLUD13), n_amostras)

# Removendo NAs apenas das variáveis relevantes nas amostras selecionadas
dados_filtrados <- INFLUD13[amostras, ]
dados_filtrados <- dados_filtrados[!is.na(dados_filtrados$FEBRE) & 
                                   !is.na(dados_filtrados$TOSSE) & 
                                   !is.na(dados_filtrados$GARGANTA) & 
                                   !is.na(dados_filtrados$DT_SIN_PRI) &
                                   !is.na(dados_filtrados$CS_SEXO), ]

# Criando a tabela de frequência dos sintomas e sexo nas amostras selecionadas
tab_sintomas_sexo <- with(dados_filtrados, table(FEBRE, TOSSE, GARGANTA, CS_SEXO))

# Calculando as proporções de casos
proporcoes <- prop.table(tab_sintomas_sexo)

# Visualizando as proporções
proporcoes

# Criação do Gráfico de Barras
# Transformando as proporções em um dataframe
prop_df <- as.data.frame(proporcoes)

# Criando o gráfico de barras
ggplot(prop_df, aes(x = CS_SEXO, y = Freq, fill = interaction(FEBRE, TOSSE, GARGANTA))) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Sexo", y = "Proporção", fill = "Sintomas") +
  theme_minimal()

# ============================================================================================================
# TERCEIRA ANÁLISE
# Relação entre os sintomas (febre, tosse e dor de garganta) e Gestante

# Definindo amostras (1000)
n_amostras <- 1000

# Selecionando aleatoriamente 1000 observações do dataframe
amostras <- sample(nrow(INFLUD13), n_amostras)

# Removendo NAs apenas das variáveis relevantes nas amostras selecionadas
dados_filtrados <- INFLUD13[amostras, ]
dados_filtrados <- dados_filtrados[!is.na(dados_filtrados$FEBRE) & 
                                   !is.na(dados_filtrados$TOSSE) & 
                                   !is.na(dados_filtrados$GARGANTA) & 
                                   !is.na(dados_filtrados$CS_GESTANT), ]

# Criando a tabela de frequência dos sintomas e gestante nas amostras selecionadas
tab_sintomas_gestante <- with(dados_filtrados, table(FEBRE, TOSSE, GARGANTA, CS_GESTANT))

# Calculando as proporções de casos
proporcoes <- prop.table(tab_sintomas_gestante)

# Visualizando as proporções
print(proporcoes)

# Criação do Gráfico de Barras
# Transformando as proporções em um dataframe
prop_df <- as.data.frame(proporcoes)

# Criando o gráfico de barras
ggplot(prop_df, aes(x = CS_GESTANT, y = Freq, fill = interaction(FEBRE, TOSSE, GARGANTA))) +
  geom_bar(stat = "identity", position = "stack") +
  labs(x = "Gestante", y = "Proporção", fill = "Sintomas") +
  theme_minimal()

