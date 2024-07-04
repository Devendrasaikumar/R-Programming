a = 400
b = 600
c = 880

if (a > b & a > c & b > c) {
  print("A is Big")
} else if (b > a & b > c) {
  print("B is Big")
} else if (c > a & c > b) {
  print("C is Big")
}



#### Fahrenheit ####
f=90
c=(f-32)*100/180
c




### Mean ###
a=c(23,44,66,77,88)
sum(a)
length(a)
mean=sum(a)/length(a)
mean
mean(a)




### Median ###
a=c(23,44,66,77,88)
s <- sort(a)
d <- length(s)
if (d %% 2 == 0) {
  median <- (s[d/2] + s[(d/2) + 1]) / 2
} else {
  median <- s[(d + 1) / 2]
}
print(paste("Median:", median))




#### Prime Numbers ###

n=59
if (n == 2 | n == 3) {
  print("The number is prime.")
} else if (n %% 2 == 0 | n %% 3 == 0) {
  print("The number is not prime.")
} else {
  print("The number is prime.")
}

