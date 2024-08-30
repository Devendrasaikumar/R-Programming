library(ggplot2)

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))
val


# Basic Line
ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line()+
  geom_point()


#geom_line() connects points from left to right
#geom_path() is similar but connects points 
#--------------------------------------------------------------------
#--------------------------------------------------------------------


# Changing Format line

val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Format the line type
ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(linetype = "dotted")+
  geom_point()

#--------------------------------------------------------------------
#--------------------------------------------------------------------

#Changing Line colors

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Format the line color
ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(color="red")+
  geom_point()

#--------------------------------------------------------------------
#--------------------------------------------------------------------


#Adding Line size  and Titles

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Adding titles
line<-ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(color="green",linewidth=1)+
  geom_point()

line+ggtitle("Line plot")+
  labs(x="Courses",y="Number of Students")

#--------------------------------------------------------------------
#--------------------------------------------------------------------

# Changing Theame

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Adding titles
line<-ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(color="green",size=1.5)+
  geom_point()

line+ggtitle("Courses vs Students Enrolled in GeeksforGeeks")+
  labs(x="Courses",y="Number of Students")+
  theme_dark()

#--------------------------------------------------------------------
#--------------------------------------------------------------------

# Adding Arrow

#-----------------> Use library Grid function to add arrow

library(ggplot2)
library(grid)

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Adding an arrow
ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(arrow=arrow())+
  geom_point()

# Adding closed arrow on both ends of the line
arr=arrow(angle = 20, ends = "both", type = "closed")
ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(arrow=arr)+
  geom_point()

#--------------------------------------------------------------------
#--------------------------------------------------------------------


# Adding Data Labels 


# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Adding data label
ggplot(data=val, aes(x=course, y=num, group=1, label=num)) +
  geom_line()+
  geom_point()+
  geom_text(nudge_y = 2)

#--------------(nudge_y = 2----> Use this function(2---> Position))------------------------


# Using Limit in Axis

# Create data for chart
val <-data.frame(course=c('DSA','C++','R','Python'),
                 num=c(77,55,80,60))

# Storing the line plot
ln <-ggplot(data=val, aes(x=course, y=num, group=1)) +
  geom_line(color="green",size=2)+
  geom_point()

# y-axis limits
ln+ylim(0,100)+
  theme_dark()






















