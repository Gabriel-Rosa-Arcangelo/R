
setwd("C:\Users\gabri\OneDrive\Documentos\IBM\do_age_MG.dta")

require(foreign)

dados<-read.dta("do_age_MG.dta")

barplot(table(dados$covid,dados$idade))

teste<-dados[which(dados$idade>0),]

barplot(table(teste$covid,teste$idade),col=c("#DC143C","#6959CD"),xlab="Idade",ylab="Quantidade")
title("Relação entre causa da morte e idade")
legend("topleft",legend = c("covid19","outras causas"),fill = c("#DC143C","#6959CD"))

# criando piramide etária
require(apyramid)

# criando subconjunto de variáveis para plotar piramide
# conferir a sintaxe com "help(apyramid)"
# variáveis devem estar declaradas como "factor()"
piramide.covid<-data.frame(idade=factor(teste$idade),covid=teste$covid,stringsAsFactors=TRUE)

# comando que plota a piramide por causa da morte
age_pyramid(piramide.covid,age_group=idade,split_by=covid)

# piramide por sexo
piramide.sexo<-data.frame(idade=factor(teste$idade),sexo=teste$sexo,stringsAsFactors=TRUE)
age_pyramid(piramide.sexo,age_group=idade,split_by=sexo)
# sexo ignorado? (I) ... retirar estes dados
# eliminando sexo="I" ... variável temporária
piramide.tmp<-teste[which(teste$sexo!="I"),]
# checando eliminação 
table(piramide.tmp$sexo)
# ... ok

# agora preparar o data.frame para apyramid
piramide.sexo<-data.frame(idade=factor(piramide.tmp$idade),sexo=piramide.tmp$sexo,stringsAsFactors=TRUE)
age_pyramid(piramide.sexo,age_group=idade,split_by=sexo,show_midpoint=FALSE)



###### CRIANDO FAIXAS ETÁRIAS DE 10 EM 10 ANOS
# 1-10anos, 11-20anos, 21-30anos, 31-40anos, 41-50anos, 51-60anos, 61-70anos, 71-80ano, 81-90anos, +90anos
# cria data.frame expandido com variável etaria, que conterá classificação da idade (NA=vazio)
dados.etaria<-data.frame(dados,etaria=NA)

# lê o número de linhas a classificar
k<-dim(dados.etaria)[1]

# loop de classificação da idade em faixas etárias
for (i in 1:k) {
   y<-dados.etaria$idade[i]/10
   if (y-round(y)>0) {dados.etaria$etaria[i]=round(y)+1 } else {dados.etaria$etaria[i]=round(y) }
   }
# criando fatores
niveis<-c(1:10)
rotulos<-c("1-10anos", "11-20anos","21-30anos","31-40anos","41-50anos","51-60anos","61-70anos","71-80anos","81-90anos","+90anos")
# aplicando fatores à variável
# dados.etaria$etaria=factor(dados.etaria$etaria, levels=niveis, lab=rotulos,ord=TRUE)

# agora preparar o data.frame para apyramid
piramide.etaria<-data.frame(etaria=factor(dados.etaria$etaria),sexo=dados.etaria$sexo,stringsAsFactors=TRUE)
age_pyramid(piramide.etaria,age_group=etaria,split_by=sexo,show_midpoint=FALSE,)


###### CRIANDO FAIXAS ETÁRIAS POR FASES DA VIDA
# 1-12anos, 13-17anos, 18-25anos, 26-45anos, 46-65anos, +65anos
dados<-read.dta("do_age_MG.dta")
# eliminando sexo="I" ... visto que produziremos uma pirâmide
dados<-dados[which(dados$sexo!="I"),]
# cria data.frame expandido com variável etaria, que conterá classificação da idade (NA=vazio)
dados.etaria<-data.frame(dados,etaria=NA)

# lê o número de linhas a classificar
k<-dim(dados.etaria)[1]

# loop de classificação da idade em faixas etárias
for (i in 1:k) {
   if (dados.etaria$idade[i]<=12) {dados.etaria$etaria[i]=1}
   if (dados.etaria$idade[i]>12 & dados.etaria$idade[i]<=17) {dados.etaria$etaria[i]=2}
   if (dados.etaria$idade[i]>=18 & dados.etaria$idade[i]<=25) {dados.etaria$etaria[i]=3}
   if (dados.etaria$idade[i]>=26 & dados.etaria$idade[i]<=45) {dados.etaria$etaria[i]=4}
   if (dados.etaria$idade[i]>=46 & dados.etaria$idade[i]<=65) {dados.etaria$etaria[i]=5}
   if (dados.etaria$idade[i]>65) {dados.etaria$etaria[i]=6}
   }
# criando fatores
niveis<-c(1:6)
rotulos<-c("1a12", "13a17","18a25","26a45","46a65","+65")
# aplicando fatores à variável
dados.etaria$etaria=factor(dados.etaria$etaria, levels=niveis, lab=rotulos,ord=TRUE)

# agora preparar o data.frame para apyramid
piramide.etaria<-data.frame(etaria=factor(dados.etaria$etaria),sexo=dados.etaria$sexo,stringsAsFactors=TRUE)
age_pyramid(piramide.etaria,age_group=etaria,split_by=sexo,show_midpoint=FALSE)

# plotando outros gráficos com a variável faixa etária
barplot(table(dados.etaria$covid,dados.etaria$etaria), col=c("red","lightgreen"))
legend(20500,legend=c("covid-19","outras causas"), fill=c("red","lightgreen"),box.col=NA)



###### TRABALHANDO SOMENTE COM MORTES POR COVID-19
###### CRIANDO FAIXAS ETÁRIAS POR FASES DA VIDA
# 1-12anos, 13-17anos, 18-25anos, 26-45anos, 46-65anos, +65anos
dados<-read.dta("do_age_BA.dta")
# eliminando sexo="I" ... visto que produziremos uma pirâmide
dados<-dados[which(dados$sexo!="I"),]

# eliminando outras causas de mortes para ficar somente com as de covid-19
dados<-dados[which(dados$covid=="covid19"),]

# cria data.frame expandido com variável etaria, que conterá classificação da idade (NA=vazio)
dados.etaria<-data.frame(dados,etaria=NA)

# lê o número de linhas a classificar
k<-dim(dados.etaria)[1]

# loop de classificação da idade em faixas etárias
for (i in 1:k) {
   if (dados.etaria$idade[i]<=12) {dados.etaria$etaria[i]=1}
   if (dados.etaria$idade[i]>12 & dados.etaria$idade[i]<=17) {dados.etaria$etaria[i]=2}
   if (dados.etaria$idade[i]>=18 & dados.etaria$idade[i]<=25) {dados.etaria$etaria[i]=3}
   if (dados.etaria$idade[i]>=26 & dados.etaria$idade[i]<=45) {dados.etaria$etaria[i]=4}
   if (dados.etaria$idade[i]>=46 & dados.etaria$idade[i]<=65) {dados.etaria$etaria[i]=5}
   if (dados.etaria$idade[i]>65) {dados.etaria$etaria[i]=6}
   }
# criando fatores
niveis<-c(1:6)
rotulos<-c("1a12", "13a17","18a25","26a45","46a65","+65")
# aplicando fatores à variável
dados.etaria$etaria=factor(dados.etaria$etaria, levels=niveis, lab=rotulos,ord=TRUE)

# palette de cores predefinidas R3, ggplot2, ... lista de palletes comando palette.pals()
barplot(table(dados.etaria$regiao_saude,dados.etaria$etaria),col=palette("R3"))
# abre outra tela gráfica
x11()
barplot(table(dados.etaria$regiao_saude,dados.etaria$etaria),col=palette("ggplot2"))
# abre outra tela gráfica
x11()
barplot(table(dados.etaria$regiao_saude,dados.etaria$etaria),col=palette("Pastel 1"))
# abre outra tela gráfica
x11()
barplot(table(dados.etaria$regiao_saude,dados.etaria$etaria),col=palette("Accent"))



