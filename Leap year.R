#2024: Divisible by 4, so it's a leap year.
#1900: Divisible by 100, but not by 400, so it's not a leap year.
#2000: Divisible by both 100 and 400, so it's a leap year.
#2021: Not divisible by 4, so it's not a leap year.
#%%; Using this for remainder Module





#### Example Program ###

is_leap_year <- function(year) {
  if ((year %% 4 == 0 && year %% 100 != 0) || year %% 400 == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}
years <- c(2000, 2001, 2004, 1900, 2100, 2400)
leap_years <- sapply(years,is_leap_year )
leap_years
result <- data.frame(Year = years, IsLeapYear = leap_years)
print(result)







# Function to check if a year is a leap year
is_leap_year <- function(year) {
  if ((year %% 4 == 0 && year %% 100 != 0) || year %% 400 == 0) {
    return(TRUE)
  } else {
    return(FALSE)
  }
}

# Example usage
year <- 1900
if (is_leap_year(year)) {
  print(paste(year, "is a leap year"))
} else {
  print(paste(year, "is not a leap year"))
}




#### Divisible only with 4 ###

year1 <- 1900

if (year1 %% 4 == 0 ) {
  print(paste(year1, "is a leap year"))
} else {
  print(paste(year1, "is not a leap year"))
}



#### Simple Method ####

yr = 2023
a = yr / 4
b = yr/100
c = yr/400
print(a)
print(b)
print(c)

if((yr %% 4 == 0 && yr %% 100 != 0) || yr %% 400 == 0) {
  print("YES")
}else{
  print("NO")
}


