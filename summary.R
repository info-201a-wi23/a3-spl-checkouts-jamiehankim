# Load DPLYR
library("dplyr")

# The Five Values
spl_df <- read.csv("~/Desktop/INFO201/a3-spl-checkouts-jamiehankim/2022-2023-All-Checkouts-SPL-Data.csv", stringsAsFactors = FALSE)

# What is the average number of checkouts for each material type?
# Atlas 
avg_num_atlas <- spl_df %>% filter(MaterialType == "ATLAS") %>% summarize(avg = mean(Checkouts, na.rm = TRUE))
avg_num_atlas
# Audio books
avg_num_audiobook <- spl_df %>% filter(MaterialType == "AUDIOBOOK") %>% summarize(avg = mean(Checkouts, na.rm = TRUE))
avg_num_audiobook
# Book
avg_num_book <- spl_df %>% filter(MaterialType == "BOOK") %>% summarize(avg = mean(Checkouts, na.rm = TRUE))
avg_num_book
# Ebooks
avg_num_ebook <- spl_df %>% filter(MaterialType == "EBOOK") %>% summarize(avg = mean(Checkouts, na.rm = TRUE))
avg_num_ebook
# Videodisc
avg_num_videodisc <- spl_df %>% filter(MaterialType == "SOUNDDISC") %>% summarize(avg = mean(Checkouts, na.rm = TRUE))
avg_num_videodisc

# What is the type of book with the biggest number of checkouts? 
max_checkouts <- spl_df %>% filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% pull(MaterialType)
max_checkouts

# What is the type of book with the lowest number of checkouts? 
min_checkouts <- spl_df %>% filter(Checkouts == min(Checkouts, na.rm = TRUE)) %>% pull(MaterialType) %>% unique()
min_checkouts

# What is the month with the most checkouts for ebooks in 2022?
max_ebooks <- spl_df %>% filter(CheckoutYear == "2022") %>%  filter(Checkouts == max(Checkouts, na.rm = TRUE)) %>% pull(CheckoutMonth)

# How did the checkout numbers of books change in 2022? 
checkout <- spl_df %>% filter(CheckoutYear == "2022") %>% filter(MaterialType == "BOOK") %>% 
  group_by(CheckoutMonth) %>% summarize(total = sum(CheckoutMonth, na.rm = TRUE))

checkout2 <- spl_df %>% filter(CheckoutYear == "2022") %>% filter(MaterialType == "ATLAS" | MaterialType == "AUDIOBOOK" | MaterialType == "BOOK" | MaterialType == "EBOOK" | MaterialType == "SOUNDDISC") %>% 
  group_by(MaterialType) %>% summarize(total = sum(CheckoutMonth, na.rm = TRUE))


