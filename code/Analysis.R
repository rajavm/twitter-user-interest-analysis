#=============================TRAINING===============================
setwd("~/Documents/twitter")
library("e1071")
library("RTextTools")
library("wordcloud")

library(twitteR)
library(ROAuth)

options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))



set.seed(77)



art <- read.csv("arts.csv",header=T,na.string="")
art <- na.omit(art)
art <- as.character(art$user)
art <- iconv(art,to="UTF-8", sub="")
art <- sample(art,1500)
art_cat <- rep("arts",length(art))
art_data <-cbind(art,art_cat)

business <- read.csv("business.csv",header=T,na.string="")
business <- na.omit(business)
business <- as.character(business$user)
business <- iconv(business,to="UTF-8", sub="")
business <-sample(business,1500)
bus_cat <- rep("business",length(business))
bus_data <-cbind(business,bus_cat)

food <- read.csv("food.csv",header=T,na.string="")
food <- na.omit(food)
food <- as.character(food$user)
food <- iconv(food,to="UTF-8", sub="")
food <- sample(food,1500)
food_cat <- rep("food",length(food))
food_data <-cbind(food,food_cat)

fashion <- read.csv("fashion.csv",header=T,na.string="")  ####################v1 in a2
fashion <- na.omit(fashion)
fashion <- as.character(fashion$user)
fashion <- iconv(fashion,to="UTF-8", sub="")
fashion <- sample(fashion,1500)
fashion_cat <- rep("fashion",length(fashion))
fashion_data <-cbind(fashion,fashion_cat)

music <- read.csv("music.csv",header=T,na.string="")
music <- na.omit(music)
music <- as.character(music$user)
music <- iconv(music,to="UTF-8", sub="")
music <- sample(music,1500)
music_cat <- rep("music",length(music))
music_data <-cbind(music,music_cat)

movies <- read.csv("movies.csv",header=T,na.string="")
movies <- na.omit(movies)
movies <- as.character(movies$user)
movies <- iconv(movies,to="UTF-8", sub="")
movies <- sample(movies,1500)
movies_cat <- rep("movies",length(movies))
movies_data <-cbind(movies,movies_cat)

politics <- read.csv("politics.csv",header=T,na.string="")
politics <- na.omit(politics)
politics <- as.character(politics$user)
politics <- iconv(politics,to="UTF-8", sub="")
politics <- sample(politics,1500)
politics_cat <- rep("politics",length(politics),na.string="")
politics_data <-cbind(politics,politics_cat)

sport <- read.csv("sports.csv",header=T,na.string="")
sport <- na.omit(sport)
sport <- as.character(sport$user)
sport <- iconv(sport,to="UTF-8", sub="")
sport <- sample(sport, 1500)
sport_cat <- rep("sport",length(sport))
sport_data <-cbind(sport,sport_cat)

technology <- read.csv("technology.csv",header=T,na.string="")
technology <- na.omit(technology)
technology <- as.character(technology$user)
technology <- iconv(technology,to="UTF-8", sub="")
technology <- sample(technology,1500)
tech_cat <- rep("technology",length(technology))
tech_data <-cbind(technology,tech_cat)

total <- rbind(art_data,bus_data,politics_data,food_data,sport_data,tech_data,music_data,fashion_data,movies_data)

#total <- iconv(total,to="utf-8")
#total <- (total[!is.na(total)])

#total <- iconv(total, to = "UTF-8", sub="")


write.csv(total,"total.csv",fileEncoding="UTF-8")

#total<- read.csv("total.csv",header=T)

#[,1]
matrix <- create_matrix(total[,1], language="english", removeStopwords=T, removeNumbers=T,stemWords=T, toLower=T, removePunctuation=T, removeSparseTerms=0.998)
mat <- as.matrix(matrix)
#write.csv(mat,"mat.csv")
#mat<- read.csv("mat.csv",header=T)
#matrix <- TermDocumentMatrix(total[,1], control = list(language="english", removeStopwords=T, removeNumbers=T,stemWords=T, toLower=T, removePunctuation=T, removeSparseTerms=0.998))



svm_classifier = svm(mat,as.factor(total[,2]))

#save(svm_classifier, file = "model_latest.rda")




#===========================FUNCTIONS==============================


predictTest <- function(test_user, mat, classifier){
  train_mat = mat[1:2,]
  train_mat[,1:ncol(train_mat)] = 0
  
  test_matrix = create_matrix(test_user, language="english", removeStopwords=T, removeNumbers=T,stemWords=T, toLower=T, removePunctuation=T)
  test_mat <- as.matrix(test_matrix)
  flag <- F
  for(col in colnames(test_mat)){
    if(col %in% colnames(train_mat))
    { print(col)
      print(test_mat[1,col])
      flag <- T
      train_mat[2,col] = test_mat[1,col];
    }
  }
  if (flag == F)
  {
    "others"
  }
  else{
    
    #test_mat = as.matrix(t(test_mat))
    row.names(train_mat)[1] = ""
    row.names(train_mat)[2] = test_user
    p <- predict(classifier, train_mat[1:2,])
    as.character(p[2])
  }
}

get_tweets <- function(user_name){
  user <- userTimeline(user_name,n=50)
  user <-twListToDF(user)
  tweets <- as.data.frame(user$text)
  tweets[,1] <- as.character(tweets[,1])
  for (i in 1:length(tweets[,1])){
    tweets[i,1] <- gsub('http\\S+\\s*', '', tweets[i,1])
    tweets[i,1] <- gsub('[\r\n\t]', '', tweets[i,1])
  }
  na.omit(tweets)
}

print_word_cloud <- function(table){
  classes <- c("others","arts","business","food","fashion","music","movies","politics","sport","technology")
  data <- table[,2]
  wordcloud(classes,data,colors=c(1:10),ordered.colors=T)
}


get_result_table <- function(user_name){
  times <- as.data.frame(rep.int(0,10))
  percentage <- as.data.frame(rep.int(0,10))
  classes <- c("technology","arts","business","food","fashion","music","movies","politics","sport","others")
  result_table <- cbind(classes, times,percentage)
  colnames(result_table) <- c("classes", "times","percentage")
  tweets <- get_tweets(user_name)
  num_tweets = 0;
  for (i in 1:length(tweets[,1])){
    current <- tweets[i,1]
    result <- predictTest(current, mat, svm_classifier)
    # print(result)
    for (j in 1:10){
      if (result_table[j,1]==result){
       # print(result_table[j,2])  ###added here
        result_table[j,2]=result_table[j,2]+1
        num_tweets = num_tweets + 1
      }
    }
  }
  for (j in 1:10){
    result_table[j,3] = result_table[j,2]/num_tweets
  }
#final
  print_word_cloud(result_table)
  
  result_table[order(-result_table[,3]),]
}



# get_result_table("raja_vm")
#get_result_table("foodandwine")
#get_result_table("Burberry")
#get_result_table("sri50")
#get_result_table("psdthiru")
#get_result_table("olacabs")
#
#
#
#
