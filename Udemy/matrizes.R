?matrix

matriz <- matrix(c(1,5,10,30,15,8), nrow=3, ncol=2, byrow=TRUE)
print(matriz)

matriz <- matrix(c(1,5,10,30,15,8), nrow=3, ncol=2, byrow=FALSE)
print(matriz)

matriz <- matrix(c(1,5,10,30,15,8), nrow=2, ncol=3, byrow=FALSE)
print(matriz)

matriz[2,2]

vetorA <- c(2,5,8)
vetorB <- c(3,6,9)

matriz2 <-rbind(vetorA, vetorB)
matriz2

dim(matriz2)
#nrow e ncol

dimnames(matriz2) <- list(c("Linha1","linha2"),c("Coluna1","Coluna2","Coluna3"))
matriz2

produto <- 2 * matriz2
produto

#Cálculo

soma = produto+matriz2
soma

subtracao = soma - produto
subtracao

produto_matriz = matriz2 %*% c(2,3,4)
produto_matriz

mediacol <- colMeans(matriz2)
mediacol
