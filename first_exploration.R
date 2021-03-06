
# Let's start exploring the counties with the greatest level of ozone

ranking <- ozone %>% 
        group_by(State.Name,County.Name) %>% 
        summarize(ozone = mean(Sample.Measurement)) %>% 
        as.data.frame() %>% 
        arrange(desc(ozone))
head(ranking,10)
tail(ranking,10)

#Let's look at how many observation there are for the Mariposa County in California
ozone %>% 
        filter(State.Name == "California" & County.Name == "Mariposa") %>% 
        nrow

#looking at the monthly data
ozone <- ozone %>% 
        mutate(Date.Local= as.Date(Date.Local))

ozone %>% 
        filter(State.Name == "California" & County.Name == "Mariposa") %>% 
        mutate(month = factor(months(Date.Local), levels = month.name)) %>% 
        group_by(month) %>% 
        summarize(ozone = mean(Sample.Measurement))

#let's take a look at the County with the lowest mean

ozone %>% 
        filter(State.Name =="Oklahoma" & County.Name == "Caddo") %>% 
        nrow


ozone %>% 
        filter(State.Name == "Oklahoma" & County.Name == "Caddo") %>% 
        mutate(month = factor(months(Date.Local), levels = month.name)) %>% 
        group_by(month) %>% 
        summarize(ozone = mean(Sample.Measurement))

#  how stable are the rankings from year to year”
# applying bootstrap sample

set.seed(10234)
N <-  nrow(ozone)
idx <- sample(N,N,replace= T)

ozone2 <- ozone[idx,]  

ranking2 <- ozone2 %>% 
        group_by(State.Name,County.Name) %>% 
        summarize(ozone = mean(Sample.Measurement)) %>% 
        as.data.frame() %>% 
        arrange(desc(ozone))

cbind(head(ranking,10),
      head(ranking2,10)) #rankings are stable over time

cbind(tail(ranking,10),
      tail(ranking2,10))

 
        



