# this function creates and writes Training and Validation dataFrames, 70:30 split

df <- load_data("Raw Data/final_train.csv")

sample <- sample.int(n = nrow(df), size = floor(0.7 * nrow(df)), replace = FALSE)

df[sample, ] %>% write_csv(., "Clean Data/part_train.csv")
df[-sample,] %>% write_csv(., "Clean Data/part_validate.csv")

