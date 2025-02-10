# CSV Caminho
Caminho_csv <- "INFLUD13.csv"

# Leitura de CSV
INFLUD13 <- read.csv2(Caminho_csv)

################################################################################

# ANÁLISES PROBABILÍSTICAS

# Carregar pacote necessário
library(ggplot2)

# ============================================================================================================
# PRIMEIRA ANÁLISE
# Estimativa de probabilidade de vacinação 
# Filtrar apenas os casos com valores válidos (1 e 2)
data_valid <- subset(INFLUD13, VACINA %in% c(1, 2))

# Calcular as probabilidades
prob_vacinado <- prop.table(table(data_valid$VACINA))[1]  # Probabilidade de ter se vacinado (valor 1)
prob_nao_vacinado <- prop.table(table(data_valid$VACINA))[2]  # Probabilidade de não ter se vacinado (valor 2)

# Exibir as probabilidades
print(prob_vacinado)
print(prob_nao_vacinado)

# Dados das probabilidades
probabilidades <- data.frame(
  Categoria = c("Vacinação", "Não Vacinação"),
  Probabilidade = c(prob_vacinado, prob_nao_vacinado)
)

# Criar o gráfico de barras
grafico <- ggplot(probabilidades, aes(x = Categoria, y = Probabilidade)) +
  geom_bar(stat = "identity", fill = "orange") +
  labs(x = "Categoria", y = "Probabilidade") +
  ggtitle("Probabilidade de Vacinação contra Gripe") +
  theme_minimal()

# Exibir o gráfico
print(grafico)

# ============================================================================================================
# SEGUNDA ANÁLISE
# Estimativa de probabilidade de vacinação entre pardos e pretos
# Filtrar apenas os casos com valores válidos (1 e 2) nas variáveis de interesse
data_valid <- subset(INFLUD13, VACINA %in% c(1, 2) & CS_RACA %in% c(2, 4))

# Calcular as probabilidades
total_pessoas <- nrow(data_valid)  # Total de pessoas pretas ou pardas com valores válidos
total_vacinados <- sum(data_valid$VACINA == 1)  # Total de pessoas pretas ou pardas vacinadas (valor 1)

prob_vacinado_preta_parda <- total_vacinados / total_pessoas  # Probabilidade de pessoa preta ou parda ter se vacinado

# Exibir a probabilidade
print(prob_vacinado_preta_parda)

# Dados do gráfico
dados_grafico <- c(prob_vacinado_preta_parda, 1 - prob_vacinado_preta_parda)
nomes_grafico <- c("Vacinado", "Não Vacinado")
cores_grafico <- c("green", "red")

# Gráfico de barras
barplot(dados_grafico, main = "Probabilidade de Vacinação em Pessoas Pretas ou Pardas",
        xlab = "Categoria", ylab = "Probabilidade", ylim = c(0, 1),
        col = cores_grafico, names.arg = nomes_grafico)

# ============================================================================================================
# TERCEIRA ANÁLISE
# Estimativa de probabilidade de vacinação entre pardos e pretos do sexo feminino
# Filtrar apenas os casos com valores válidos (1 e 2) nas variáveis de interesse
data_valid <- subset(INFLUD13, VACINA %in% c(1, 2) & CS_RACA %in% c(2, 4) & CS_SEXO == "F")

# Calcular as probabilidades
total_pessoas <- nrow(data_valid)  # Total de pessoas pretas ou pardas do sexo feminino com valores válidos
total_nao_vacinados <- sum(data_valid$VACINA == 2)  # Total de pessoas pretas ou pardas do sexo feminino não vacinadas (valor 2)

prob_nao_vacinado_preta_parda_feminino <- total_nao_vacinados / total_pessoas  # Probabilidade de pessoa preta ou parda do sexo feminino não ter se vacinado

# Exibir a probabilidade
print(prob_nao_vacinado_preta_parda_feminino)


# Filtrar apenas os casos com valores válidos (1 e 2) nas variáveis de interesse
data_valid <- subset(INFLUD13, VACINA %in% c(1, 2) & CS_RACA %in% c(2, 4) & CS_SEXO %in% c("M", "F"))

# Calcular as proporções
prop_nao_vacinado <- prop.table(table(data_valid$CS_RACA, data_valid$CS_SEXO, data_valid$VACINA))[2, , 2] # Proporção de não vacinados (valor 2)

# Criar um dataframe para o gráfico
df <- data.frame(CS_RACA = c("Preta", "Parda"), CS_SEXO = c("Masculino", "Feminino"), Proporcao_Nao_Vacinado = prop_nao_vacinado)

# Criar o gráfico de barras
ggplot(df, aes(x = CS_RACA, y = Proporcao_Nao_Vacinado, fill = CS_SEXO)) +
  geom_bar(stat = "identity", position = "dodge") +
  labs(x = "Raça/Cor", y = "Proporção de Não Vacinados", fill = "Sexo") +
  ggtitle("Proporção de Não Vacinados por Raça/Cor e Sexo") +
  theme_minimal()

# ============================================================================================================
# QUARTA ANÁLISE
# Estimativa de Probabilidade de Sintomas: Febre, Tosse e Dor de Garganta

# Contagem dos casos de febre
casos_febre <- sum(INFLUD13$FEBRE == 1, na.rm = TRUE)

# Contagem dos casos de tosse
casos_tosse <- sum(INFLUD13$TOSSE == 1, na.rm = TRUE)

# Contagem dos casos de dor de garganta
casos_garganta <- sum(INFLUD13$GARGANTA == 1, na.rm = TRUE)

# Número total de pacientes
total_pacientes <- nrow(INFLUD13)

# Cálculo das probabilidades
probabilidade_febre <- casos_febre / total_pacientes
probabilidade_tosse <- casos_tosse / total_pacientes
probabilidade_garganta <- casos_garganta / total_pacientes

# Exibindo os resultados
print(paste("Febre:", format(probabilidade_febre * 100, digits = 4), "%"))
print(paste("Tosse:", format(probabilidade_tosse * 100, digits = 4), "%"))
print(paste("Dor de Garganta:", format(probabilidade_garganta * 100, digits = 4), "%"))

# Criação do dataframe com os dados das probabilidades
dados <- data.frame(
  Sintoma = c("Febre", "Tosse", "Dor de Garganta"),
  Probabilidade = c(probabilidade_febre, probabilidade_tosse, probabilidade_garganta) * 100
)

# Criação do gráfico de barras
grafico <- ggplot(dados, aes(x = Sintoma, y = Probabilidade)) +
  geom_bar(stat = "identity", fill = "darkgreen") +
  labs(title = "Probabilidade de Sintomas", x = "Sintoma", y = "Probabilidade (%)")

# Exibição do gráfico
print(grafico)

# ============================================================================================================
# QUINTA ANÁLISE
# Estimativa de Probabilidade de Vacinação contra a Gripe

# Contagem dos casos de vacinação contra gripe
casos_vacina <- sum(INFLUD13$VACINA == 1, na.rm = TRUE)

# Número total de pacientes
total_pacientes <- nrow(INFLUD13)

# Cálculo da probabilidade de vacinação contra gripe
probabilidade_vacina <- casos_vacina / total_pacientes

# Exibindo o resultado
print(paste("Vacinação contra Gripe:", format(probabilidade_vacina * 100, digits = 4), "%"))

# Criação do dataframe com os dados da probabilidade de vacinação contra a gripe
dados <- data.frame(
  Categoria = c("Vacinação contra Gripe", "Outros"),
  Probabilidade = c(probabilidade_vacina, 1 - probabilidade_vacina) * 100
)

# Criação do gráfico de barras
grafico <- ggplot(dados, aes(x = Categoria, y = Probabilidade, fill = Categoria)) +
  geom_bar(stat = "identity") +
  labs(title = "Estimativa de Probabilidade de Vacinação contra a Gripe",
       x = "Categoria",
       y = "Probabilidade (%)") +
  theme_minimal()

# Exibição do gráfico
print(grafico)

# ============================================================================================================
# SEXTA ANÁLISE
# Estimativa de Probabilidade de Categorias de Gestação

# Contagem dos casos de gestação no primeiro trimestre
casos_trimestre1 <- sum(INFLUD13$CS_GESTANT == 1, na.rm = TRUE)

# Contagem dos casos de gestação no segundo trimestre
casos_trimestre2 <- sum(INFLUD13$CS_GESTANT == 2, na.rm = TRUE)

# Contagem dos casos de gestação no terceiro trimestre
casos_trimestre3 <- sum(INFLUD13$CS_GESTANT == 3, na.rm = TRUE)

# Contagem dos casos de gestação com idade gestacional ignorada
casos_gestacional_ignorado <- sum(INFLUD13$CS_GESTANT == 4, na.rm = TRUE)

# Contagem dos casos sem gestação
casos_sem_gestacao <- sum(INFLUD13$CS_GESTANT == 5, na.rm = TRUE)

# Contagem dos casos sem aplicação da variável gestação
casos_sem_aplicacao <- sum(INFLUD13$CS_GESTANT == 6, na.rm = TRUE)

# Número total de pacientes
total_pacientes <- nrow(INFLUD13)

# Cálculo das probabilidades
probabilidade_trimestre1 <- casos_trimestre1 / total_pacientes
probabilidade_trimestre2 <- casos_trimestre2 / total_pacientes
probabilidade_trimestre3 <- casos_trimestre3 / total_pacientes
probabilidade_gestacional_ignorado <- casos_gestacional_ignorado / total_pacientes
probabilidade_sem_gestacao <- casos_sem_gestacao / total_pacientes
probabilidade_sem_aplicacao <- casos_sem_aplicacao / total_pacientes

# Exibindo os resultados
print(paste("Gestação no 1º Trimestre:", format(probabilidade_trimestre1 * 100, digits = 4), "%"))
print(paste("Gestação no 2º Trimestre:", format(probabilidade_trimestre2 * 100, digits = 4), "%"))
print(paste("Gestação no 3º Trimestre:", format(probabilidade_trimestre3 * 100, digits = 4), "%"))
print(paste("Gestação com Idade Gestacional Ignorada:", format(probabilidade_gestacional_ignorado * 100, digits = 4), "%"))
print(paste("Sem Gestação:", format(probabilidade_sem_gestacao * 100, digits = 4), "%"))
print(paste("Não se Aplica:", format(probabilidade_sem_aplicacao * 100, digits = 4), "%"))

# Criação do dataframe com os dados das probabilidades de gestação
dados <- data.frame(
  Categoria = c("1º Trimestre", "2º Trimestre", "3º Trimestre", "Idade Gestacional Ignorada", "Sem Gestação", "Não se Aplica"),
  Probabilidade = c(probabilidade_trimestre1, probabilidade_trimestre2, probabilidade_trimestre3, probabilidade_gestacional_ignorado, probabilidade_sem_gestacao, probabilidade_sem_aplicacao) * 100
)

# Criação do gráfico de barras
grafico <- ggplot(dados, aes(x = Categoria, y = Probabilidade, fill = Categoria)) +
  geom_bar(stat = "identity") +
  labs(title = "Estimativa de Probabilidade de Categorias de Gestação",
       x = "Categoria",
       y = "Probabilidade (%)") +
  theme_minimal()

# Exibição do gráfico
print(grafico)
