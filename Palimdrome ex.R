# ----------------------------------------------------------

# Palindrome Program

# ----------------------------------------------------------

# Get User input
# inputstr = readline("Enter any String : "); 

inputstr <- "Goog"

# Lowercase
inputstr <- tolower(inputstr)
# Remove Blank Space
inputstr <- gsub(" ", "" ,inputstr)
# Length of the string
len = nchar(inputstr)
print(len)
# Reverse the string
outputstr = ""
for (i in len : 1){
  x = substring(inputstr,i,i)
  outputstr = paste(outputstr,x,sep ="")
  print (paste("i = ",i)) 
  print (paste("x = ", x))
  print (paste("outputstr = " , outputstr))
  print ("-----------------------------------")
} 

# Final Check
if (inputstr == outputstr) {
  print("Actual and Reverse string are Equal!")
} else{
  print ("Actual and Reverse string are NOT Equal!")
}

# ----------------------------------------------------------

