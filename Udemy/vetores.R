vetor <- c(1,2,3,4,5,6,7)
class(vetor)
vetor

dias <- c("seg", "ter", "qua", "qui", "sex", "sab", "dom")
class(dias)

juntando <-c(vetor,dias)
juntando

gastos_dia <- c(400, 300, 100, 500, 150, 430, 70)
gastos_dia
ordem_crescente <- sort(gastos_dia)
ordem_crescente

total <- sum(gastos_dia)
total

#min max mean

limite <- (gastos_dia <- 300)
limite

intervalo <- (3:8)
intervalo

passo <- seq(2,42, by=5)
passo

repeticao <- rep(2,8)

vetor2 <- c(2,4,6,8,10,12)
vetor3 <- c(vetor2,14)
vetor3

vetor3 <- as.integer(vetor3)
class(vetor3)

posicao <- vetor2[2]
posicao
