for(i in 1:10) {
  print(i)
}

lista <- c(1,2,3,4,10)
for (numero in lista){
  mult = numero * 2
  print(mult)
}

c <- 1
while (c <= 10){
  print(c)
  c <- c+2
}

y <- 2
repeat {
  print(y)
  y <- y +1
  if (y >= 10) break()
}
}