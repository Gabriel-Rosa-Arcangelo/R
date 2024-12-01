escolaridade <- c("fundamental", "médio", "superior")
print(escolaridade)

escolaridade_fator <- as.factor(escolaridade)
print(escolaridade_fator)

escolaridade[2]
escolaridade_fator[2]

summary(escolaridade)
summary(escolaridade_fator)

table(escolaridade)

valores <- c(110,220,330,230,450,96)
summary(valores)

valores_fator <- as.factor(valores)
summary(valores_fator)
