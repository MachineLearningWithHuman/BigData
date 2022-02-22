install.packages(c("DBI", "dplyr","dbplyr","odbc"))
library(DBI)
library(dplyr)
library(dbplyr)
library(odbc)
library(DT)
myconn <- DBI::dbConnect(odbc::odbc(), "snowflake R", uid="kipimini", pwd='Kipi@100')
mydata <- DBI::dbGetQuery(myconn,"SHOW WAREHOUSES")
head(mydata)

datatable(mydata)

## feedback data

data <- DBI::dbGetQuery(myconn,"select REVIEWTEXT from PC_FIVETRAN_DB.PUBLIC.FEEDBACK ")
datatable(data)


#library
library(wordcloud2)
library(readr)
library(tm)
#library(dplyr)


data_corpus = Corpus(VectorSource(data$REVIEWTEXT))

data_corpus = data_corpus %>%
                tm_map(removeNumbers) %>%
                tm_map(removePunctuation) %>%
                tm_map(stripWhitespace) %>%
                tm_map(content_transformer(tolower)) %>%
                tm_map(removeWords, stopwords("english")) %>%
                tm_map(removeWords, stopwords("SMART"))

tdm = TermDocumentMatrix(data_corpus) %>%
      as.matrix()
words = sort(rowSums(tdm), decreasing = TRUE)
df = data.frame(word = names(words), freq = words)

df = df %>%  filter(nchar(as.character(word)) > 2, word != "don’")

uxc.colors = c("#FEFEFE", "#F4F2A8", "#030303")
uxc.background = "#00CCFF"
library(extrafont)
# font_import()
fonts()

wordcloud2(df,
           color = rep_len(uxc.colors, nrow(df)),
           backgroundColor = uxc.background,
           fontFamily = "DM Sans",
           size = 2.5,
           minSize = 5,
           rotateRatio = 0)