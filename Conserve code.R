#Read in Consumer survey data from CSV qualtrics file. With this code, 
#you will NOT need to delete or remove any columns or rows. 
#Just put CSV in data file, update data string if title different, and run.
Consumer <- read.csv(file = "data/CONSUMER.csv", header = TRUE, na.strings = NA)
Consumer2 <- select(Consumer, EndDate, Finished, Q1_1,	Q1_2,	Q1_3,	Q1_4,	Q1_5,	Q1_6,	
                    Q1_7,	Q1_8,	Q1_9,	Q1_10,	Q1_11,	Q1_12,	Q1_13,	Q1_14,	Q1_15,	
                    Q3_1,	Q3_2,	Q3_3,	Q3_4,	Q3_5,	Q3_6,	Q3_7,	Q3_8,	Q3_9,	Q3_10,	
                    Q3_11,	Q3_12,	Q3_13,	Q3_14,	Q3_15,	Q5_1,	Q5_2,	Q5_3,	Q5_4,	
                    Q5_5,	Q5_6,	Q5_7,	Q5_8,	Q5_9,	Q5_10,	Q5_11,	Q5_12,	Q5_13,	
                    Q5_14,	Q5_15,	Q5_16,	Q7,	Q9,	Q27,	Q10,	Q11,	Q15_1,	Q15_2,	
                    Q17,	Q18,	Q19)
Consumer3 <-  Consumer2[-c(1:2), ]
head(Consumer3)

#extract date out of EndDate
format(as.Date(Consumer3$EndDate,format="%Y-%m-%d"), "%d")
mutate(Consumer3, EndDate = "%Y-%m-%d")
str(Consumer3)
format(as.Date(strptime(Consumer3, '%a %b %d %H:%M:%S EST %Y')), "%b %d %Y")

library(lubridate)
Consumer3 <- parse_date_time(EndDate, tz = "UTC", truncated = 0, quiet = FALSE,
                locale = Sys.getlocale("LC_TIME"), select_formats = .select_formats,
                exact = FALSE)



