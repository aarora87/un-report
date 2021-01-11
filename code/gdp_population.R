#load tidyverse packages
library(tidyverse)

#read in data
gapminder_1997 <- read_csv("data/gapminder_1997.csv")

name<-"Ben"
name
age<-26
age
name<-"Harry Potter"
name

# learn more about a function
?read_csv
read_csv(file="data/gapminder_1997.csv")

?round

round(3.1415)
round(3.1415,3)

#Position of the arguments in functions

round(x=3.1415)
round(x=3.1415, digits=2)
round(digits=2,x=3.1415)
round(2,3.1415)

ggplot(data=gapminder_1997) + 
  aes(x=gdpPercap, y=lifeExp) +
  labs(x="GDP Per Capita", y="Life Expectancy")+
  geom_point()


ggplot(data=gapminder_1997) + 
  aes(x=gdpPercap)+
  labs(x="GDP Per Capita")+
  aes(y=lifeExp)+
  labs(y="Life Expectancy") + 
  labs(title = "Do people in wealthy countries live longer?")+
  geom_point()+
  aes(color=continent)+ 
  scale_color_brewer(palette="Set1") + 
  aes(size=pop/1000000) + 
  labs(size="Population (in millions)") + 
  aes(shape=continent)


#Collapse code to make more concise 

ggplot(data=gapminder_1997,aes(x=gdpPercap,y=lifeExp,color=continent,size=pop/1000000)) + 
  labs(x="GDP Per Capita",y="Life Expectancy",size="Population (in millions)",title = "Do people in wealthy countries live longer?")+
  geom_point()+
  scale_color_brewer(palette="Set1") 


  

#Different color palettes

RColorBrewer::display.brewer.all()

#Add life expentancy to y axis and give it a nice label

?ggplot

# Read in full dataset
gapminder_data<-read_csv("gapminder_data.csv")
dim(gapminder_data)

ggplot(data=gapminder_data)+
  aes(x=year,y=lifeExp,color=continent, group=country)+
  geom_line()

#plot categorical variables

# use gapminder 1997 data with geom_boxplot() to make a boxplot where continent is the x-axis and LE is the y axis

ggplot(data=gapminder_1997) + 
  aes(x=continent,y=lifeExp)+
  geom_jitter(aes(size=pop))+
  geom_violin(alpha=0.5, fill='darkolivegreen', aes(fill=continent))

ggplot(data=gapminder_1997) + 
  aes(x=continent,y=lifeExp)+
  geom_jitter(aes(size=pop))+
  geom_violin(alpha=0.5, fill='burlywood3', aes(fill=continent))



sample(colors(),size=20)
  
?aes()

#univariate plots

ggplot(gapminder_1997)+
  aes(x=lifeExp)+
  geom_histogram(bins=10) + 
  theme_classic() + 
  theme(axis.text.x = element_text(angle = 90,hjust=1,vjust=1))

#Figure out how to rotate x-axis labels by 90 degrees


#Saving plots 

ggsave("awesome_plot.jpg", width=6,height=4)

#Density plot is another option

?ggplot

violin_plot<-ggplot(data=gapminder_1997) + 
  aes(x=continent,y=lifeExp)+
  geom_jitter(aes(size=pop))+
  geom_violin(alpha=0.5, fill='darkolivegreen', aes(fill=continent))

violin_plot + theme_bw()
violin_plot

violin_plot <-violin_plot+theme_bw()

ggsave("awesome_violin_plot.jpg", plot=violin_plot, width=6,height=4)

#Faceting plots


ggplot(gapminder_1997) + 
  aes(x=gdpPercap,y=lifeExp)+
  geom_point()+
  facet_wrap(vars(continent))


#practice saving a plot as "my_awesome_plot.jpg"

plot2save<-ggplot(gapminder_1997) + 
  aes(x=gdpPercap,y=lifeExp)+
  geom_point()+
  facet_wrap(vars(continent))

ggsave("my_awesome_plot.jpg", plot=plot2save,width=6, height=4)

