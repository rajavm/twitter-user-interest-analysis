#set the working directory (files will be saved/loaded # from this directory)


library(twitteR)
library(ROAuth)


#options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))

#window users need to get this file

#download.file(url="http://curl.haxx.se/ca/cacert.pem", destfile="cacert.pem")


reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
consumerKey <- "rFOVZ0UMsN8vxWfZ4viNbqydK"
consumerSecret <- "YdSIAPQXCBmPqNtMgIVNzFHP8fZGk1OCNMraXtkLjinSLUjYN6"
access_token <-  "1376148354-0XDkbDMTsOVxR6ppHWt7eiWopDBUaghaTTDBWt6"

access_token_secret <-  "Ud0aEjUnSSfiZZ1n4rhJwZwMxVyhEVT5Ob5fNdXaAaMIr"
twitCred <- OAuthFactory$new(consumerKey=consumerKey,
                             consumerSecret=consumerSecret,
                             requestURL=reqURL,
                             accessURL=accessURL,
                             authURL=authURL)

twitCred$handshake()
setup_twitter_oauth(consumerKey,consumerSecret,access_token,access_token_secret)
save(twitCred, file="rajacegian.RData")
load("~/Documents/twitter/rajacegian.RData")

########################################################fashion##########################################################3

ezhu <- c("ELLEmagazine", "VogueRunway", "MichaelKors","CHANEL","voguemagazine","InStyle","FLAREfashion","Fashionista_com","wwd","Burberry")
for (i in 1:10) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("fashion",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
  
}

ELLEmagazine <- read.csv("ELLEmagazine.csv")
VogueRunway <- read.csv("VogueRunway.csv")
MichaelKors <- read.csv("MichaelKors.csv")
CHANEL <- read.csv("CHANEL.csv")
voguemagazine <- read.csv("voguemagazine.csv")
InStyle <- read.csv("InStyle.csv")
FLAREfashion<- read.csv("FLAREfashion.csv")
Fashionista_com<- read.csv("Fashionista_com.csv")
wwd <- read.csv("wwd.csv")
Burberry <- read.csv("Burberry.csv")



fashion <- rbind(ELLEmagazine,VogueRunway,
                 MichaelKors,
                 CHANEL,
                 voguemagazine,
                 InStyle,
                 FLAREfashion,
                 Fashionista_com,
                 wwd,
                 Burberry)
########################################################business##########################################################3

ezhu <- c("WSJ", "FoxBusiness", "nytimesbusiness","bloombusiness","TheEconomist","elerianm","businessinsider","HarvardBiz","Forbes","GoldmanSachs","CNBC")
for (i in 1:11 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("business",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
  
}



WSJ<- read.csv("WSJ.csv")
FoxBusiness <- read.csv("FoxBusiness.csv")
nytimesbusiness <- read.csv("nytimesbusiness.csv")
bloombusiness<- read.csv("bloombusiness.csv")
TheEconomist <- read.csv("TheEconomist.csv")
elerianm<- read.csv("elerianm.csv")
businessinsider<- read.csv("businessinsider.csv")
HarvardBiz<- read.csv("HarvardBiz.csv")
Forbes <- read.csv("Forbes.csv")
GoldmanSachs <- read.csv("GoldmanSachs.csv")
CNBC <- read.csv("CNBC.csv")


business<- rbind(WSJ,
                 FoxBusiness,
                 nytimesbusiness,
                 bloombusiness,
                 TheEconomist,
                 elerianm,
                 businessinsider,
                 HarvardBiz,
                 Forbes,
                 GoldmanSachs,
                 CNBC)
                


########################################################politics##########################################################3

ezhu <- c("ezraklein", "Philip_Elliott", "politicalwire","bpolitics","CPHeinze","LarrySabato","ndtv","BBCPolitics","foxnewspolitics","HuffPostPol")
for (i in 1:10 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("politics",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
 
}



ezraklein <- read.csv("ezraklein.csv")
Philip_Elliott <- read.csv("Philip_Elliott.csv")
politicalwire <- read.csv("politicalwire.csv")
bpolitics <- read.csv("bpolitics.csv")
CPHeinze <- read.csv("CPHeinze.csv")
LarrySabato<- read.csv("LarrySabato.csv")
ndtv<- read.csv("ndtv.csv")
BBCPolitics<- read.csv("BBCPolitics.csv")
foxnewspolitics <- read.csv("foxnewspolitics.csv")
HuffPostPol <- read.csv("HuffPostPol.csv")



politics <- rbind(ezraklein,
                  Philip_Elliott,
                  politicalwire,
                  bpolitics,
                  CPHeinze,
                  LarrySabato,
                  ndtv,
                  BBCPolitics,
                  foxnewspolitics,
                  HuffPostPol)

########################################################Sports##########################################################3

ezhu <- c("BBCSport", "darrenrovell", "beINSPORTS","Deadspin","NBCSports","NYTSports","universalsports","SportsCenter","OnionSports","YahooFantasy","cricbuzz","FOXCricketLive","ESPNTennis")
for (i in 1:13 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("sports",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}


BBCSport <- read.csv("BBCSport.csv")
darrenrovell <- read.csv("darrenrovell.csv")
beINSPORTS <- read.csv("beINSPORTS.csv")
Deadspin <- read.csv("Deadspin.csv")
NBCSports <- read.csv("NBCSports.csv")
NYTSports<- read.csv("NYTSports.csv")
universalsports<- read.csv("universalsports.csv")
SportsCenter<- read.csv("SportsCenter.csv")
OnionSports <- read.csv("OnionSports.csv")
YahooFantasy <- read.csv("YahooFantasy.csv")
cricbuzz<- read.csv("cricbuzz.csv")
FOXCricketLive <- read.csv("FOXCricketLive.csv")
ESPNTennis <- read.csv("ESPNTennis.csv")



sports <- rbind(BBCSport,
                darrenrovell,
                beINSPORTS,
                Deadspin,
                NBCSports,
                NYTSports,
                universalsports,
                SportsCenter,
                OnionSports,
                YahooFantasy,
                cricbuzz,
                FOXCricketLive,
                ESPNTennis)

########################################################technology##########################################################
ezhu <- c("BBCTech", "Gizmodo", "NASA","newscientist","ScienceNews","TechCrunch","PopSci","engadget","WIRED","IEEEXplore")
for (i in 1:10 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("technology",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}



BBCTech <- read.csv("BBCTech.csv")
Gizmodo <- read.csv("Gizmodo.csv")
NASA <- read.csv("NASA.csv")
newscientist <- read.csv("newscientist.csv")
ScienceNews <- read.csv("ScienceNews.csv")
TechCrunch<- read.csv("TechCrunch.csv")
PopSci<- read.csv("PopSci.csv")
engadget <- read.csv("engadget.csv")
WIRED<- read.csv("WIRED.csv")
IEEEXplore <- read.csv("IEEEXplore.csv")




technology <- rbind(BBCTech,
                    Gizmodo,
                    NASA,
                    newscientist,
                    ScienceNews,
                    TechCrunch,
                    PopSci,
                    engadget,
                    WIRED,
                    IEEEXplore)

########################################################arts##########################################################
ezhu <- c("bbcarts", "nytimesarts", "MuseumModernArt","Americans4Arts","TheStreetArts","DesignMuseum","walkerartcenter","mfaboston")
for (i in 1:8 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("arts",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}




bbcarts <- read.csv("bbcarts.csv")
nytimesarts <- read.csv("nytimesarts.csv")
MuseumModernArt <- read.csv("MuseumModernArt.csv")
Americans4Arts <- read.csv("Americans4Arts.csv")
TheStreetArts <- read.csv("TheStreetArts.csv")
DesignMuseum<- read.csv("DesignMuseum.csv")
walkerartcenter<- read.csv("walkerartcenter.csv")
mfaboston<- read.csv("mfaboston.csv")




arts <- rbind(bbcarts,
              nytimesarts,
              MuseumModernArt,
              Americans4Arts,
              TheStreetArts,
              DesignMuseum,
              walkerartcenter,
              mfaboston)


########################################################food##########################################################
ezhu <- c("FoodNetwork", "Food", "foodandwine","ItsFoodPorn","nytfoodfeed","bonappetit","Bourdain","joshfriedland","WholeFoods","seriouseats","jamieoliver")
for (i in 1:11 ) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("food",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}




FoodNetwork <- read.csv("FoodNetwork.csv")
Food <- read.csv("Food.csv")
foodandwine <- read.csv("foodandwine.csv")
ItsFoodPorn <- read.csv("ItsFoodPorn.csv")
nytfoodfeed <- read.csv("nytfoodfeed.csv")
bonappetit<- read.csv("bonappetit.csv")
jamieoliver<- read.csv("jamieoliver.csv")
joshfriedland<- read.csv("joshfriedland.csv")
WholeFoods<- read.csv("WholeFoods.csv")
seriouseats<- read.csv("seriouseats.csv")
Bourdain<- read.csv("Bourdain.csv")




food <- rbind(FoodNetwork,
              Food,
              foodandwine,
              ItsFoodPorn,
              nytfoodfeed,
              bonappetit,
              jamieoliver,
              joshfriedland,
              WholeFoods,
              seriouseats,
              Bourdain)


########################################################music##########################################################
ezhu <- c("billboard", "TwitterMusic", "SonyMusicGlobal","amazonmusic","SonyMusicSouth","AppleMusic","Beats1","thedailyswarm","Stereogum","PasteMagazine","Spotify")
for (i in 1:11) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("music",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}




billboard <- read.csv("billboard.csv")
TwitterMusic <- read.csv("TwitterMusic.csv")
SonyMusicGlobal <- read.csv("SonyMusicGlobal.csv")
amazonmusic <- read.csv("amazonmusic.csv")
SonyMusicSouth <- read.csv("SonyMusicSouth.csv")
AppleMusic<- read.csv("AppleMusic.csv")
Beats1<- read.csv("Beats1.csv")
soundofthecity <- read.csv("Stereogum.csv")
thedailyswarm<- read.csv("thedailyswarm.csv")
PasteMagazine<- read.csv("PasteMagazine.csv")
Spotify<- read.csv("Spotify.csv")




music <- rbind(billboard,
               TwitterMusic,
               SonyMusicGlobal,
               amazonmusic,
               SonyMusicSouth,
               AppleMusic,
               Beats1,thedailyswarm,
               soundofthecity,
               PasteMagazine,
               Spotify
)

########################################################movies##########################################################
ezhu <- c("IBNLiveMovies", "taran_adarsh", "TFU_Kannan","KomalNahta","AndhraBoxOffice","cinetimes_in","TamilBoxOffice1","OnlyKollywood","TwitterMovies","ErosNow","IMDb")
for (i in 1:11) {
  user <- userTimeline(ezhu[i],n=500)
  type <- rep("movies",length(user))
  user <- twListToDF(user)
  user <- user$text
  user <- cbind(user,type)
  write.csv(user,paste(ezhu[i], "csv", sep="."))
}





IBNLiveMovies <- read.csv("IBNLiveMovies.csv")
taran_adarsh <- read.csv("taran_adarsh.csv")
TFU_Kannan <- read.csv("TFU_Kannan.csv")
KomalNahta <- read.csv("KomalNahta.csv")
AndhraBoxOffice<- read.csv("AndhraBoxOffice.csv")
cinetimes_in<- read.csv("cinetimes_in.csv")
TamilBoxOffice1<- read.csv("TamilBoxOffice1.csv")
OnlyKollywood<- read.csv("OnlyKollywood.csv")
TwitterMovies<- read.csv("TwitterMovies.csv")
ErosNow<- read.csv("ErosNow.csv")
IMDb<- read.csv("IMDb.csv")





movies <- rbind(IBNLiveMovies,
                taran_adarsh,
                TFU_Kannan,
                KomalNahta,
                AndhraBoxOffice,
                cinetimes_in,
                TamilBoxOffice1,
                OnlyKollywood,
                TwitterMovies,
                ErosNow,
                IMDb)






#=========remove http links===============

food <- food[,-1]  #### cuts index 
food <- as.matrix(food)  ## converts r object into matrix.. no visual change
food <- as.data.frame(food) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
food[,1] <- as.character(food[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(food[,1])){
  food[i,1] <- gsub('http\\S+\\s*', '', food[i,1])
  food[i,1] <- gsub('[\r\n\t]', '', food[i,1])
}

write.csv(food,"food.csv")



fashion <- fashion[,-1]  #### cuts index 
fashion <- as.matrix(fashion)  ## converts r object into matrix.. no visual change
fashion <- as.data.frame(fashion) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
fashion[,1] <- as.character(fashion[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(fashion[,1])){
  fashion[i,1] <- gsub('http\\S+\\s*', '', fashion[i,1])
  fashion[i,1] <- gsub('[\r\n\t]', '', fashion[i,1])
}

write.csv(fashion,"fashion.csv")



business <- business[,-1]  #### cuts index 
business <- as.matrix(business)  ## converts r object into matrix.. no visual change
business <- as.data.frame(business) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
business[,1] <- as.character(business[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(business[,1])){
  business[i,1] <- gsub('http\\S+\\s*', '', business[i,1])
  business[i,1] <- gsub('[\r\n\t]', '', business[i,1])
}

write.csv(business,"business.csv")


politics <- politics[,-1]  #### cuts index 
politics <- as.matrix(politics)  ## converts r object into matrix.. no visual change
politics <- as.data.frame(politics) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
politics[,1] <- as.character(politics[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(politics[,1])){
  politics[i,1] <- gsub('http\\S+\\s*', '', politics[i,1])
  politics[i,1] <- gsub('[\r\n\t]', '', politics[i,1])
}

write.csv(politics,"politics.csv")



sports <- sports[,-1]  #### cuts index 
sports <- as.matrix(sports)  ## converts r object into matrix.. no visual change
sports <- as.data.frame(sports) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
sports[,1] <- as.character(sports[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(sports[,1])){
  sports[i,1] <- gsub('http\\S+\\s*', '', sports[i,1])
  sports[i,1] <- gsub('[\r\n\t]', '', sports[i,1])
}

write.csv(sports,"sports.csv")



technology <- technology[,-1]  #### cuts index 
technology <- as.matrix(technology)  ## converts r object into matrix.. no visual change
technology <- as.data.frame(technology) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
technology[,1] <- as.character(technology[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(technology[,1])){
  technology[i,1] <- gsub('http\\S+\\s*', '', technology[i,1])
  technology[i,1] <- gsub('[\r\n\t]', '', technology[i,1])
}

write.csv(technology,"technology.csv")




arts <- arts[,-1]  #### cuts index 
arts <- as.matrix(arts)  ## converts r object into matrix.. no visual change
arts <- as.data.frame(arts) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
arts[,1] <- as.character(arts[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(arts[,1])){
  arts[i,1] <- gsub('http\\S+\\s*', '', arts[i,1])
  arts[i,1] <- gsub('[\r\n\t]', '', arts[i,1])
}

write.csv(arts,"arts.csv")


music <- music[,-1]  #### cuts index 
music <- as.matrix(music)  ## converts r object into matrix.. no visual change
music <- as.data.frame(music) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
music[,1] <- as.character(music[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(music[,1])){
  music[i,1] <- gsub('http\\S+\\s*', '', music[i,1])
  music[i,1] <- gsub('[\r\n\t]', '', music[i,1])
}

write.csv(music,"music.csv")



movies <- movies[,-1]  #### cuts index 
movies <- as.matrix(movies)  ## converts r object into matrix.. no visual change
movies <- as.data.frame(movies) ##check r object is a data frame, or coerce it if possible. #returns a data frame #a list of vectors of equal length
movies[,1] <- as.character(movies[,1])  ##attempts to coerce its argument to character type


for (i in 1:length(movies[,1])){
  movies[i,1] <- gsub('http\\S+\\s*', '', movies[i,1])
  movies[i,1] <- gsub('[\r\n\t]', '', movies[i,1])
}

write.csv(movies,"movies.csv")

