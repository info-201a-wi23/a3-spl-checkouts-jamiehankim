# Load libraries
library("dplyr")
library("scales")
library(ggplot2)

# Load data 
spl_df <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Chart 2
chart2_df <- spl_df %>% filter(MaterialType == "ATLAS" | MaterialType == "AUDIOBOOK" | MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "SOUNDDISC") %>% 
  group_by(CheckoutYear) %>% 
  summarize(total = sum(Checkouts, na.rm = TRUE))

ggplot(chart2_df) + 
  geom_line(aes(x = CheckoutYear, 
                y = total, 
                color = total)) +
  labs(title = "Trends of Checkouts From 2022 to 2023", x = "Year", y = "Number of Checkouts") + 
  scale_y_continuous(labels = label_number_si())
