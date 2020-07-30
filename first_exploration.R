
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
