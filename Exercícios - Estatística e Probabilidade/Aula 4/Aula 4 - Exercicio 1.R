#1)
df <- data.frame(Categoria = c("Ações", "Bonds", "RF", "Poupança"), 
                 Investidor_A = c(46.5, 32.0, 15.5, 16.0),
                 Investidor_B = c(55,   44,   20,   28  ),
                 Investidor_C = c(27.5, 19.0, 13.5, 7.0 ))

View(df)

Total_Investidor_A <- sum(df$Investidor_A)
Total_Investidor_A

Total_Investidor_B <- sum(df$Investidor_B)
Total_Investidor_B

Total_Investidor_C <- sum(df$Investidor_C)
Total_Investidor_C

Total_Ações <- sum(df$Investidor_A[1], df$Investidor_B[1], df$Investidor_C[1])
Total_Ações

Total_Bonds <- sum(df$Investidor_A[2], df$Investidor_B[2], df$Investidor_C[2])
Total_Bonds

Total_RF <- sum(df$Investidor_A[3], df$Investidor_B[3], df$Investidor_C[3])
Total_RF

Total_Poupanca <- sum(df$Investidor_A[4], df$Investidor_B[4], df$Investidor_C[4])
Total_Poupanca

Total <- sum(Total_Ações, Total_Bonds, Total_RF, Total_Poupanca)
Total

#Tabela de contingência: distribuição das frequências absolutas entre as variáveis Y e V
Tabela_de_Contigencia <- data.frame(Categoria    = c("Ações", "Bonds", "RF", "Poupança", "Total"), 
                                    Investidor_A = c(46.5, 32.0, 15.5, 16.0, Total_Investidor_A),
                                    Investidor_B = c(55,   44,   20,   28,   Total_Investidor_B),
                                    Investidor_C = c(27.5, 19.0, 13.5, 7.0,  Total_Investidor_C),
                                    Total =        c(Total_Ações, Total_Bonds, 
                                                     Total_RF, Total_Poupanca, Total))

View(Tabela_de_Contigencia)

#Tabela de contingência: frequência das observações em relação ao total da amostra em %
Investidor_A_Amostra <- round((Tabela_de_Contigencia$Investidor_A / Total) * 100)
Investidor_A_Amostra

Investidor_B_Amostra <- round((Tabela_de_Contigencia$Investidor_B / Total) * 100)
Investidor_B_Amostra

Investidor_C_Amostra <- round((Tabela_de_Contigencia$Investidor_C / Total) * 100)
Investidor_C_Amostra

Total_Ações_Amostra <- sum(Investidor_A_Amostra[1], Investidor_B_Amostra[1], Investidor_C_Amostra[1])
Total_Ações_Amostra

Total_Bonds_Amostra <- sum(Investidor_A_Amostra[2], Investidor_B_Amostra[2], Investidor_C_Amostra[2])
Total_Bonds_Amostra

Total_RF_Amostra <- sum(Investidor_A_Amostra[3], Investidor_B_Amostra[3], Investidor_C_Amostra[3])
Total_RF_Amostra

Total_Poupanca_Amostra <- sum(Investidor_A_Amostra[4], Investidor_B_Amostra[4], Investidor_C_Amostra[4])
Total_Poupanca_Amostra

Total_Amostra <- sum(Total_Ações_Amostra, Total_Bonds_Amostra, Total_RF_Amostra, Total_Poupanca_Amostra)
Total_Amostra

Tabela_de_Contigencia_Amostra <- data.frame(Categoria    = c("Ações", "Bonds", "RF", "Poupança", "Total"),
                                            Investidor_A = c(Investidor_A_Amostra),
                                            Investidor_B = c(Investidor_B_Amostra),
                                            Investidor_C = c(Investidor_C_Amostra),
                                            Total        = c(Total_Ações_Amostra, Total_Bonds_Amostra,
                                                             Total_RF_Amostra, Total_Poupanca_Amostra,
                                                             Total_Amostra))


View(Tabela_de_Contigencia_Amostra)

#Tabela de contingência: Análises pelo total da coluna em %
Investidor_A_Coluna <- round((Tabela_de_Contigencia_Amostra$Investidor_A / Tabela_de_Contigencia_Amostra$Investidor_A[5]) * 100)
Investidor_A_Coluna

Investidor_B_Coluna <- round((Tabela_de_Contigencia_Amostra$Investidor_B / Tabela_de_Contigencia_Amostra$Investidor_B[5]) * 100)
Investidor_B_Coluna

Investidor_C_Coluna <- round((Tabela_de_Contigencia_Amostra$Investidor_C / Tabela_de_Contigencia_Amostra$Investidor_C[5]) * 100)
Investidor_C_Coluna

Tabela_de_Contigencia_Coluna <- data.frame(Categoria     = c("Ações", "Bonds", "RF", "Poupança", "Total"),
                                            Investidor_A = c(Investidor_A_Coluna),
                                            Investidor_B = c(Investidor_B_Coluna),
                                            Investidor_C = c(Investidor_C_Coluna),
                                            Total        = c(Total_Ações_Amostra, Total_Bonds_Amostra,
                                                             Total_RF_Amostra, Total_Poupanca_Amostra,
                                                             Total_Amostra))


View(Tabela_de_Contigencia_Coluna)

#Tabela de contingência: Análises pelo total da linha em %

Total_Ações_Linha <- sum(Investidor_A_Amostra[1], Investidor_B_Amostra[1], Investidor_C_Amostra[1])
Total_Ações_Linha

Ações_Linha_A <- round((Investidor_A_Amostra[1] / Total_Ações_Linha) * 100)
Ações_Linha_A

Ações_Linha_B <- round((Investidor_B_Amostra[1] / Total_Ações_Linha) * 100)
Ações_Linha_B

Ações_Linha_C <- round((Investidor_C_Amostra[1] / Total_Ações_Linha) * 100)
Ações_Linha_C

Total_Bonds_Linha <- sum(Investidor_A_Amostra[2], Investidor_B_Amostra[2], Investidor_C_Amostra[2])
Total_Bonds_Linha

Bonds_Linha_A <- round((Investidor_A_Amostra[2] / Total_Bonds_Linha) * 100)
Bonds_Linha_A

Bonds_Linha_B <- round((Investidor_B_Amostra[2] / Total_Bonds_Linha) * 100)
Bonds_Linha_B

Bonds_Linha_C <- round((Investidor_C_Amostra[2] / Total_Bonds_Linha) * 100)
Bonds_Linha_C

Total_RF_Linha <- sum(Investidor_A_Amostra[3], Investidor_B_Amostra[3], Investidor_C_Amostra[3])
Total_RF_Linha

RF_Linha_A <- round((Investidor_A_Amostra[3] / Total_RF_Linha) * 100)
RF_Linha_A

RF_Linha_B <- round((Investidor_B_Amostra[3] / Total_RF_Linha) * 100)
RF_Linha_B

RF_Linha_C <- round((Investidor_C_Amostra[3] / Total_RF_Linha) * 100)
RF_Linha_C

Total_Poupanca_Linha <- sum(Investidor_A_Amostra[4], Investidor_B_Amostra[4], Investidor_C_Amostra[4])
Total_Poupanca_Linha

Poupanca_Linha_A <- round((Investidor_A_Amostra[4] / Total_Poupanca_Linha) * 100)
Poupanca_Linha_A

Poupanca_Linha_B <- round((Investidor_B_Amostra[4] / Total_Poupanca_Linha) * 100)
Poupanca_Linha_B

Poupanca_Linha_C <- round((Investidor_C_Amostra[4] / Total_Poupanca_Linha) * 100)
Poupanca_Linha_C

Tabela_de_Contigencia_Linha <- data.frame(Categoria      = c("Ações", "Bonds", "RF", "Poupança", "Total"),
                                            Investidor_A = c(Ações_Linha_A, Bonds_Linha_A, RF_Linha_A, Poupanca_Linha_A, Investidor_A_Amostra[5]),
                                            Investidor_B = c(Ações_Linha_B, Bonds_Linha_B, RF_Linha_B, Poupanca_Linha_B, Investidor_B_Amostra[5]),
                                            Investidor_C = c(Ações_Linha_C, Bonds_Linha_C, RF_Linha_C, Poupanca_Linha_C, Investidor_C_Amostra[5]),
                                            Total        = c(100, 100, 100, 100, 100))

View(Tabela_de_Contigencia_Linha)
