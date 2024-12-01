mes_numero = seq(1,12, by=1)
mes_numero

mes_nome = c("jan","fev","mar","abr","mai","jun","jul","ago","set","out","nov","dez")
ano = rep(2021, 12)
print(ano)

data_frame = data.frame(mes_numero,mes_nome,ano)

View(data_frame)

# Data frames do R

df <- mtcars
df
View(df)

df2 <- airquality
df2

summary(mtcars)

library(help = "datasets")

# listas

nome <- c("Luciano","Pedro","Joyce")
idade <- c(36, 44, 18)
lista <- list(nome, idade)
print(lista)

lista[2]

