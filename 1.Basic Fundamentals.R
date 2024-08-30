# Basic Fundamentals

#-------------------------------------------------------------------------------

# Simple Syntax

print("Ms")
print(12)

#------------------------------------------------------------------------------#

# Assiging Variables

A ="M"

B = "Sai"

C = "kumar"

D = 25

print(A)
print(B)
print(C)
print(D)

#----------------------------------------------------------------------------#


# Comments

"Ms is Good"
#"Ms is Bad"

#----------------------------------------------------------------------------#

# Data Types

X1=10

X2=100L

X3="Ms"

X4=9i+3

X5= FALSE
  
print(class(X1))
print(class(X2))
print(class(X3))
print(class(X4))
print(class(X5))

#---------------------------------------------------------------------------#

# Operators

# Arthamateic Operators

x=10
y=20

a= x +  y 
b= x -  y
c= x *  y
d= x /  y

print(a)
print(b)
print(c)
print(d)


# Relational Operator

x=20
y=30

a= x >  y 
b= x <  y
c= x != y
d= x >= y
e= x <= y
f= x == y

print(a) 
print(b)
print(c)
print(d)
print(e)
print(f)

# Logical Opeartor

Age = 25
Gender = "Male"

a = Age > 21 & Gender == "Male"
b = Age < 21 & Gender == "Male"

c = Age < 21 | Gender == "Male"
d = Age > 21 | Gender == "Male"

print(a)
print(b)
print(c)
print(d)

Age1 = 25
e = !(Age1 < 21)
f = !(Age1 > 21)
print(e)
print(f)


#---------------------------------------------------------------------#

# Lists

list_data = list("MS", "Sai", "Kumar", c(25,26,11), TRUE, 51.23, 119.1)
print(list_data)

#-------------------------------------------------------------------#

# Matrix Data

# Elements are arranged sequentially by row.
M = matrix(c(3:14), nrow = 4, byrow = TRUE)
print(M)

# Elements are arranged sequentially by column.
N =  matrix(c(3:14), nrow = 4, byrow = FALSE)
print(N)

# Define the column and row names.
rownames = c("row1", "row2", "row3", "row4")
colnames = c("col1", "col2", "col3")

P = matrix(c(3:14), nrow = 4, byrow = TRUE, dimnames = list(rownames, colnames))
print(P)


#-------------------------------------------------------------------------#

# Control Structures.

# Using IF

age <- 25

if (age > 20) {
  print("correct")
}


# Using IF-ELSE

age = 25

if (age < 20){ 
  print("correct")

}else{ 
  print("worng")
}


 # Using IF - ELSEIF - ELSE

age = 25

if (age >30){
  print("correct")

}else if (age > 24){
  print("Too correct")

}else {
  print("wrong")
}


 # Nested IF

edu = "B.tech"
exp = 3
age = 25

if (edu == "B.tech") {
  if (exp > 1) {
    if (age > 30) {
      print("Eligible for DATA PROCESSING")
    } else {
      print("Eligible for DATA SCIENCE")
    }
  }
} else if (age == 25 & exp == 3) {
  print("Eligible for DATA ANALYST")
} else {
  print("First Read")
}

if (edu != "B.tech") {
  print("Complete Degree")
}


#---------------------------------------------------------------------------#


# For Loop

Ms = 1:10
print(Ms)

for (i in Ms) {
  print(i)
}

age = c(23, 24, 25, 26)
print(age)

for (i in age) {
  print(i)
}


#---------------------------------------------------------------------------#



# END______________________________________________________________________
