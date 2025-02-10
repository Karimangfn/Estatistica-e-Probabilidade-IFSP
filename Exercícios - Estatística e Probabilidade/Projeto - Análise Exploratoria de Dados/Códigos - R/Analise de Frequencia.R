# CSV Caminho
Caminho_csv <- "INFLUD13.csv"

# Leitura de CSV
INFLUD13 <- read.csv2(Caminho_csv)

# ============================================================================================================

# ANÁLISE DE FREQUÊNCIA

# Carregar pacote necessário
library(ggplot2)

# ============================================================================================================
# PRIMEIRA ANÁLISE
# Data dos primeiros sintomas / Diagnóstico 
table(INFLUD13$DT_SIN_PRI)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = DT_SIN_PRI)) +
  geom_bar() +
  xlab("Data dos primeiros sintomas / Diagnóstico") +
  ylab("Frequência")

# ============================================================================================================
# SEGUNDA ANÁLISE
# Gestante
table(INFLUD13$CS_GESTANT)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = CS_GESTANT)) +
  geom_bar() +
  xlab("Gestante") +
  ylab("Frequência")

# ============================================================================================================
# TERCEIRA ANÁLISE
# Sexo
table(INFLUD13$CS_SEXO)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = CS_SEXO)) +
  geom_bar() +
  xlab("Sexo") +
  ylab("Frequência")

# ============================================================================================================
# QUARTA ANÁLISE
# Raça/Cor 
table(INFLUD13$CS_RACA)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = CS_RACA)) +
  geom_bar() +
  xlab("Raça/Cor") +
  ylab("Frequência")

# ============================================================================================================
# QUINTA ANÁLISE
# Recebeu vacina contra gripe 
table(INFLUD13$VACINA)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = VACINA)) +
  geom_bar() +
  xlab("Recebeu vacina contra gripe") +
  ylab("Frequência")

# ============================================================================================================
# SEXTA ANÁLISE
# Sinais e sintomas - febre 
table(INFLUD13$FEBRE)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = FEBRE)) +
  geom_bar() +
  xlab("Sinais e sintomas - febre") +
  ylab("Frequência")

# ============================================================================================================
# SÉTIMA ANÁLISE
# Sinais e sintomas - tosse 
table(INFLUD13$TOSSE)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = TOSSE)) +
  geom_bar() +
  xlab("Sinais e sintomas - tosse") +
  ylab("Frequência")

# ============================================================================================================
# OITAVA ANÁLISE
# Sinais e sintomas - dor de garganta
table(INFLUD13$GARGANTA)

# Gráfico de Barras
ggplot(INFLUD13, aes(x = GARGANTA)) +
  geom_bar() +
  xlab("Sinais e sintomas - dor de garganta") +
  ylab("Frequência")
