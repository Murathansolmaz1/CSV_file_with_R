#Murathan Solmaz

library(tidyverse)

data<- read_csv2("C:/documents/data.csv")
data


newdata <- data.frame(sample_n(data ,100))
newdata


question1 <- newdata %>%
  group_by(Color,Sales) %>%
  summarize(mean = mean(Sales))
question1


question2 <- newdata %>%
  group_by(Region,Sales) %>%
  summarize(mean = mean(Sales))
question2


question3a <- newdata %>%
  group_by(Date,Sales) %>%
  arrange(desc(Sales)) %>%
  head(5)
question3a

question3b <- newdata %>%
  group_by(Color,Sales) %>%
  arrange(desc(Sales)) %>%
  head(5)
question3b

question3c <- newdata %>%
  group_by(Region,Sales) %>%
  arrange(desc(Sales)) %>%
  head(5)
question3c


question4 <- newdata %>%
  separate(Date, into = c("day", "month","year"), sep = "-",convert = TRUE) %>%
  group_by(month,Sales) %>%
  summarize(mean = mean(Sales)) %>%
  arrange(desc(Sales)) %>%
  head(1)
question4



plotdata <- newdata %>%
  separate(Date, into = c("day", "month","year"), sep = "-",convert = TRUE) 

question5 <- ggplot(data = plotdata , aes(x = year , y = Sales, color = "white")) +
  geom_point() +
  labs(title = "Sales year by year", 
       y = "Sales")
question5
