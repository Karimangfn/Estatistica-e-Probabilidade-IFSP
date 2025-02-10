# 3)
df <- data.frame(MPa = c(22.2, 40.4, 16.4, 73.7, 36.6, 109.9,
                         30.0, 4.4,  33.1, 66.7, 81.5))

df_Ordenado <- data.frame(MPa = c(df[order(df$MPa),]))

# a) Determine o valor da média amostral.
Media_Amostral = mean(df$MPa)
Media_Amostral

# b) Determine o valor da mediana amostral. Por que esse valor é tão diferente da média?
Mediana_Amostral = median(df$MPa)
Mediana_Amostral

#Porque a média é a soma dos valores dividida pela quantidade, enquanto que a médiana é o Numero do Meio em uma Sequencia Ordenada do Menor valor ao Maior Valor

# c) Calcule a média aparada, excluindo a menor e a maior observações.
Media_Aparada = mean(df_Ordenado$MPa[2:10])
Media_Aparada
