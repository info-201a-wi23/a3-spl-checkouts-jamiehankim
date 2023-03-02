# Load DPLYR and ggplot
library(dplyr)
library(ggplot2)

# Load data 
spl_df <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Chart 1
chart1_df <- spl_df %>% filter(CheckoutYear == "2022") %>% 
  filter(MaterialType == "ATLAS" | MaterialType == "AUDIOBOOK" | MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "SOUNDDISC") %>% 
  select(MaterialType, CheckoutMonth, Checkouts)

# Create a bar chart
ggplot(chart1_df) + geom_bar(aes(x = CheckoutMonth, fill = MaterialType)) + labs(title = "The Five Types of Books Over Month", x = "Month(s)", y = "Number of Checkouts", fill = "MaterialType") + scale_x_continuous(breaks = seq(1, 12, 1)) 
