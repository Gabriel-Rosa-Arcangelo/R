#script prova
#Grupo A: Gabriel Rosa, Gustavo Kendi, Omotayo Itunnu, Melissa Reolon
setwd("C:/rcg1026/")
require(foreign)
dados<-read.dta("dados_morteinfantil_SP.dta")
ls(dados)

#barplot(table(dados1$escmae,dados1$idade_dias),col=c("purple","yellow"), beside=T)

dados.fase<-data.frame(dados,fase=NA)

k<-dim(dados.fase)[1]

# loop de classificação da idade em faixas etárias
for (i in 1:k) {
  if (dados.fase$idade_dias[i]>=0 & dados.fase$idade_dias[i]<=6) {dados.fase$idade_dias[i]=1}
  if (dados.fase$idade_dias[i]>=7 & dados.fase$idade_dias[i]<=27) {dados.fase$idade_dias[i]=2}
  if (dados.fase$idade_dias[i]>=28 & dados.fase$idade_dias[i]<=365) {dados.fase$idade_dias[i]=3}

}

par(bg="#E1F1FD",col.axis="black",cex.axis=0.8)

niveis<-c(1,2,3,4,5,9)

rotulos<-c("Nenhuma", "1-3 anos","4-7 anos","8-11 anos","12anos e mais","Ignorado")

dados$escmae=factor(dados$escmae, levels=niveis, lab=rotulos,ord=TRUE)

barplot(table(dados.fase$idade_dias,dados$escmae), col=c("purple","lightgreen","pink"), beside=T, xlab = "Escolaridade", ylab = "Óbitos infantis")


abline(h=c(100,200, 300, 400),col=gray(0.0),lw=1.5)

title("Óbito infantil por escolaridade materna")

legend("topleft",legend = c("Neonatal precoce","Neonatal tardio","Pós neonatal"),fill = c("purple","lightgreen","pink"))





