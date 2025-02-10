# 2) O tempo que um motorista leva para reagir às luzes de freio em um veículo em
# desaceleração é crucial para evitar colisões traseiras. O tempo de reação de uma resposta
# no trânsito a um sinal de frenagem com luzes de freio convencionais pode ser modelado
# com uma distribuição normal de média 1,25 s e desvio padrão 0,46 s. Qual é a
# probabilidade de que o tempo de reação esteja entre 1,00 e 1,75 segundo?

# Formula
# pnorm (q, média, sd, lower.tail)

# Separação de Variaveis
# média = 1.25
# desvião padrao = 0.46
# q = 1.75 e 1.00

# Explicação para os Calculos abaixo:
# No nosso caso, queremos calcular a probabilidade acumulada até 1,75 segundos e subtrair a 
# probabilidade acumulada até 1,00 segundo para obter a probabilidade de que o tempo de reação 
# esteja entre 1,00 e 1,75 segundos.

media <- 1.25
desvio_padrao <- 0.46

probabilidade <- pnorm(1.75, mean = media, sd = desvio_padrao) - 
                 pnorm(1.00, mean = media, sd = desvio_padrao)

probabilidade

# Menor = True, Maior = False
