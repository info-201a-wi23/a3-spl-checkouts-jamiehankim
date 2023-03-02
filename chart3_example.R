# Load libraries
library("dplyr")
library("scales")
library(ggplot2)

# Load data 
spl_df <- read.csv("~/Desktop/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# Chart 2
chart3_df <- spl_df %>% filter(CheckoutYear == "2022") %>% filter(MaterialType == "ATLAS" | MaterialType == "AUDIOBOOK" | MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "SOUNDDISC") %>% group_by(MaterialType) %>% summarize(total_checkouts = sum(Checkouts))

ggplot(chart3_df) + geom_col(mapping = aes(x = MaterialType, y = total_checkouts, fill = MaterialType)) + labs(title = "Total Number of Checkouts For Each Types of Book in 2022", x = "Material Type", y = "Number of Total", color = "MaterialType") + scale_y_continuous(labels = label_number_si())
