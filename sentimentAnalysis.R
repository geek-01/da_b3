getwd()
readLines("/Users/pro_ge3k/Downloads/apple_reviews.txt")
text=paste(readLines("/Users/pro_ge3k/Downloads/apple_reviews.txt"),collapse = " ")
library(tm)
library(stringr)
text2<-stripWhitespace(text)
text2<-removeNumbers(text2)
text2<-removePunctuation(text2)
str_split(text2,pattern = "\\s+")
textbag<-str_split(text2,pattern = "\\s+")
class(textbag)
textbag<-unlist(textbag)
wordstem(textbag)
readLines("/Users/pro_ge3k/Downloads/positive-words.txt")
passwords<-paste(readLines("/Users/pro_ge3k/Downloads/positive-words.txt"),collapse = " ")
passwords<-str_split(passwords,pattern = "\\s+")
passwords<-unlist(passwords)
scorepaswords<-sum(!is.na(match(textbag,passwords)))
readLines("/Users/pro_ge3k/Downloads/negative-words.txt")
negwords<-paste(readLines("/Users/pro_ge3k/Downloads/negative-words.txt"),collapse = " ")
negwords<-str_split(negwords,pattern = "\\s+")
negwords<-unlist(negwords)
scorenegwords<-sum(!is.na(match(textbag,negwords)))
scorenegwords
scorepaswords
if(scorepaswords>scorenegwords)
{
  print("Positive Comments")
}else{
  print("Negative")
}
score<-abs(scorepaswords<-scorenegwords)
score