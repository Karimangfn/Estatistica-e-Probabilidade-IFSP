# ANÁLISE DE VACINAÇÃO 

# Carregar pacotes necessário
library(dplyr)
library(ggplot2)

# ============================================================================================================
# PRIMEIRA ANÁLISE
# Calcular a taxa de vacinação por faixa etária
taxa_vacinacao <- INFLUD13%>%
  group_by(NU_IDADE_N) %>%
  summarize(Total = n(), Vacinados = sum(VACINA == 1), Taxa = Vacinados / Total * 100)

# Imprimir os resultados
print(taxa_vacinacao)

# ============================================================================================================
# SEGUNDA ANÁLISE
# Contar o número de vacinados e não vacinados por categoria de gestação
vacinacao_gestante <- INFLUD13 %>%
  group_by(CS_GESTANT) %>%
  summarize(Vacinados = sum(VACINA == 1, na.rm = TRUE),
            Nao_Vacinados = sum(VACINA == 2))

print(vacinacao_gestante)

# Criar o gráfico de barras
ggplot(vacinacao_gestante, aes(x = CS_GESTANT, y = Vacinados)) +
  geom_bar(stat = "identity", fill = "blue", position = "stack") +
  geom_bar(aes(y = Nao_Vacinados), stat = "identity", fill = "red", position = "stack") +
  labs(x = "Gestação", y = "Número de Pacientes", title = "Vacinação por Categoria de Gestação") +
  scale_x_discrete(labels = c("1º Trimestre", "2º Trimestre", "3º Trimestre", "Idade gestacional ignorada", "Não", "Não se aplica"))

# ============================================================================================================
# TERCEIRA ANÁLISE
# Filtrar os dados apenas para aqueles com informação de vacinação e data de sintomas/diagnóstico
dados_filtrados <- INFLUD13 %>% 
  filter(!is.na(VACINA), !is.na(DT_SIN_PRI))

# Calcular o intervalo de tempo entre os sintomas/diagnóstico e a vacinação em dias
intervalo_tempo <- dados_filtrados %>%
  mutate(DT_SIN_PRI = as.Date(DT_SIN_PRI, format = "%d/%m/%Y")) %>%
  mutate(intervalo = as.integer(as.Date(VACINA, format = "%d/%m/%Y") - DT_SIN_PRI))

# Imprimir os resultados
print(intervalo_tempo)

# Criar o histograma do intervalo de tempo
ggplot(intervalo_tempo, aes(x = intervalo)) +
  geom_histogram(binwidth = 30, fill = "skyblue", color = "black") +
  labs(x = "Intervalo de Tempo (dias)", y = "Frequência", title = "Intervalo de Tempo entre Sintomas/Diagnóstico e Vacinação") +
  theme_minimal()

# ============================================================================================================
# QUARTA ANÁLISE
# Filtrar os casos completos (sem valores ausentes)
dados_completos <- INFLUD13 %>%
  filter(complete.cases(CS_SEXO, VACINA))

# Calcular a taxa de vacinação por sexo
taxa_vacinacao_sexo <- dados_completos %>%
  group_by(CS_SEXO) %>%
  summarize(Total = n(), Vacinados = sum(VACINA == 1), Taxa = Vacinados / Total * 100)

# Imprimir os resultados
print(taxa_vacinacao_sexo)

# Criar o gráfico de barras
ggplot(taxa_vacinacao_sexo, aes(x = CS_SEXO, y = Taxa, fill = CS_SEXO)) +
  geom_bar(stat = "identity") +
  labs(x = "Sexo", y = "Taxa de Vacinação (%)", title = "Taxa de Vacinação por Sexo") +
  theme_minimal()

# ============================================================================================================
# QUINTA ANÁLISE
# Filtrar os dados excluindo os NA na variável "Raça/Cor" (CS_RACA) e nos status de vacinação
dados_filtrados <- INFLUD13 %>%
  filter(!is.na(CS_RACA) & !is.na(VACINA))

# Calcular a taxa de vacinação por raça/cor
taxa_vacinacao <- dados_filtrados %>%
  group_by(CS_RACA) %>%
  summarize(Total = n(), Vacinados = sum(VACINA == 1), Nao_Vacinados = sum(VACINA == 2))

# Exibir os resultados
print(taxa_vacinacao)

# ============================================================================================================
# SEXTA ANÁLISE
# Calcular a contagem de vacinados e não vacinados
contagem_vacina <- INFLUD13 %>%
  group_by(VACINA) %>%
  summarize(Contagem = n())

# Calcular a taxa de vacinação geral
taxa_vacinacao <- contagem_vacina %>%
  mutate(Taxa = Contagem / sum(Contagem) * 100)

# Exibir a contagem e a taxa de vacinação
print(contagem_vacina)
print(taxa_vacinacao)

# Criar um gráfico de barras
grafico <- ggplot(data = taxa_vacinacao, aes(x = VACINA, y = Taxa, fill = VACINA)) +
  geom_bar(stat = "identity") +
  labs(x = "Recebeu Vacina", y = "Taxa de Vacinação (%)", fill = "Vacinação") +
  ggtitle("Taxa de Vacinação contra Gripe") +
  theme_minimal()

# Exibir o gráfico
print(grafico)

# ============================================================================================================
# SÉTIMA ANÁLISE
# Calcular a taxa de vacinação entre pacientes com e sem febre
tabela <- table(INFLUD13$FEBRE, INFLUD13$VACINA)
taxa_vacinacao <- prop.table(tabela, margin = 1) * 100

# Exibir a tabela com a taxa de vacinação
print(taxa_vacinacao)

# Plotar um gráfico de barras comparando a vacinação entre pacientes com e sem febre
barplot(tabela, beside = TRUE, col = c("lightblue", "lightgreen"), 
        legend = c("Não Recebeu", "Recebeu"),
        main = "Vacinação contra a gripe por presença de febre",
        xlab = "Febre", ylab = "Número de pacientes")

# ============================================================================================================
# OITAVA ANÁLISE
# Calcular a taxa de vacinação entre pacientes com e sem tosse
tabela <- table(INFLUD13$TOSSE, INFLUD13$VACINA)
taxa_vacinacao <- prop.table(tabela, margin = 1) * 100

# Exibir a tabela com a taxa de vacinação
print(taxa_vacinacao)

# Plotar um gráfico de barras comparando a vacinação entre pacientes com e sem tosse
barplot(tabela, beside = TRUE, col = c("lightblue", "lightgreen"), 
        legend = c("Não Recebeu", "Recebeu"),
        main = "Vacinação contra a gripe por presença de tosse",
        xlab = "Tosse", ylab = "Número de pacientes")

# ============================================================================================================
# NONA ANÁLISE
# Criar uma tabela de contingência para a variável 'GARGANTA' e 'VACINA'
tabela <- table(INFLUD13$GARGANTA, INFLUD13$VACINA)

# Calcular as proporções de vacinação para cada categoria de dor de garganta
proporcoes <- prop.table(tabela, margin = 1)

# Exibir a tabela de proporções
proporcoes

# Criar um vetor com as categorias de dor de garganta
categorias_garganta <- c("Sim", "Não", "Ignorado")

# Criar um vetor com as proporções de vacinação para cada categoria de dor de garganta
proporcoes_vacinacao <- proporcoes[, "1"]

# Criar o gráfico de barras
barplot(proporcoes_vacinacao, names.arg = categorias_garganta, 
        xlab = "Presença de Dor de Garganta", ylab = "Proporção de Vacinação",
        main = "Relação entre Dor de Garganta e Vacinação contra Gripe",
        col = "skyblue", ylim = c(0, 1))
