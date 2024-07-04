f=read.csv("C:/Users/Admin/Downloads/bestsellers1.csv")
f
d=cor(f[sapply(f, is.numeric)])
library(ggplot2)
library(reshape2)
df = melt(d)
df
head(df)
ggplot(df, aes(x = Var1, y = Var2, fill = value)) +
  geom_tile() +
  labs(title = "Correlation Heatmap",
       x = "Variable 1",
       y = "Variable 2")

#-----------------(Syntax: geom_tile(x,y,fill))--------------------------

# Changing Colour 
ggplot(df,aes(x = Var1, y = Var2, fill = value))+
  geom_tile()+scale_fill_gradient(high = "white", low = "black")+
  labs(title = "Correlation Heatmap",
       x = "Variable 1",
       y = "Variable 2")


#-----------------------------------------------------------------------

#scale_fill_distiller(): It used to customize according to ColorBrewer palette.

ggplot(df,aes(x = Var1, y = Var2,fill = value))+
  geom_tile() + scale_fill_distiller(palette = "Spectral")+
  geom_tile() +
  labs(title = "Correlation Heatmap",
       x = "Variable 1",
       y = "Variable 2")
#-----------------------------------------------------------------------

#scale_fill_viridis(): to use viridis. In this function, discrete is set to FALSE.

install.packages("viridis")
library(viridis)
ggplot(df, aes(x = Var1, y = Var2, fill = value))+
  geom_tile() + scale_fill_viridis(discrete = FALSE)+
  geom_tile() +
  labs(title = "Correlation Heatmap",
       x = "Variable 1",
       y = "Variable 2")
#-----------------------------------------------------------------------

# Order the row:

# A heatmap can be reordered by reordering its y-elements. This can be done by reorder().

j=ggplot(df,aes(x = Var1, y = reorder(Var2, value),
                 fill = value)) + geom_tile()+
  geom_tile() +
  labs(title = "Correlation Heatmap",
       x = "Variable 1",
       y = "Variable 2")
install.packages("plotly")
library(plotly)
ggplotly(j)
#-----------------------------------------------------------------------
