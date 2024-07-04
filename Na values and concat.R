#### Concatenating ####

# create 2 different strings.
string1 <- "Sai" # first string
string2 <- "Kumar" # second string.

# use cbind method to bind the strings into a vector.
vec <- cbind(string1, string2) # combined vector.
print(vec)
# use paste() function to perform string concatenation.
S <- paste(string1, string2,sep= " ")
print(S)# print the output string

# collapse will determine how different
# elements are joined together.
M <- paste(vec, collapse = " ")
print(M) # print the output string using the collapse


#-------------------------------------------------------------------------------

# merging two data sets 
authors <- data.frame( 
  name = c("kapil", "sachin", "Rahul","Nikhil","Rohan"), 
  nationality = c("US","Australia","US","UK","India"), 
  retired = c("Yes","No","Yes","No","No")) 
authors
books <-data.frame( 
  name = c("C", "C++","Java","php",".net","R"), 
  title = c("Intro to C","Intro to C++", 
            "Intro to java", "Intro to php", 
            "Intro to .net", "Intro to R"), 
  author = c("kapil", "kapil","sachin", "Rahul", 
             "Nikhil","Nikhil")) 
books


#-------------------------------------------------------------------------------


### NA Values ###
A=c(1,2,3,NA,6)
class(A)
D=as.character(A)
D
class(D)
f=sum(is.na(A))
f
replace(A,is.na(A),5)

#-------------------------------------------------------------------------------


### Replace data with another value ####


stats <- data.frame(player=c('A', 'B', 'C', 'D',"A"),
                    runs=c(100, 200, 408, 19,100),
                    wickets=c(17, 20, 7, 5,17))
stats
stats[stats ==17] <- 0
print(stats)
data<-replace(stats$runs, stats$runs==100, 0) 
print(data)
data<-replace(stats$wickets, stats$wickets==17, 0) 
print(data)
data<-replace(stats, stats==17, 0) 
print(data)








