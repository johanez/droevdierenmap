require(xtable)
require(tidyr)
xtable(d1)
d1 %>% count(species) %>% xtable(.) %>% print(.,type = "html")

d1 %>% select(1:5) %>% xtable(.) %>% print(.,type = "html")
d1 %>% group_by(house, mainspecies) %>% 
  summarise(Count=n())  %>%
  xtable(.) %>% print(.,type = "html")
d1[162,] %>% xtable(.) %>% print(.,type = "html")


library(dplyr)
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)

# Spread and gather are complements
df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)