#install.packages('foreign')
#install.packages('readxl')
library(readxl)

library(devtools)
#devtools::install_github("cardiomoon/Kormaps", force = TRUE)
library(foreign)
require(Kormaps)
require(tmap)


Encoding(names(korpopmap2))<-"UTF-8"
Encoding(areacode$code)<-"UTF-8"
areacode
#areacode <- kormaps2014::changeCode(areacode)
#areacode

#?븿?닔

submap <- function(map,area){
  code<-area2code(area)
  if(length(code)>0) {
    code1=paste0("^",code)
    temp=Reduce(paste_or,code1)
    mydata<-map[grep(temp,map$code),]
  }
}


is.integer0 <- function(x) { is.integer(x) && length(x) == 0L}

paste_or <- function(...) {
  paste(...,sep="|")
}


area2code <- function(area){
  result<-c()
  for(i in 1:length(area)){
    pos<-grep(area[i],areacode[[2]])
    if(!is.integer0(pos)) temp<-areacode[pos,1]
    else {
      pos<-grep(area[i],areacode[[3]])
      if(!is.integer0(pos)) temp<-areacode[pos,1]
    }
    result=c(result,temp)
  }
  result
}




##불러오기

getwd()
setwd('c:/easy_r')

service <- read_excel('service_2014~2017.xlsx')
service <- as.data.frame(service)
service$`2015_useage` <- as.integer(service$`2015_useage`)
service$codecode <- as.integer(service$id)
class(service$codecode)

##

korpopmap5 <- korpopmap2
korpopmap5$codecode <- as.integer(korpopmap5$code1)
korpopmap5$codecode
class(korpopmap5$codecode)


#서울시 여성인구밀도
Seoul2=submap(korpopmap2,"서울")
qtm(Seoul2,"여자_명")


#service 2015 useage
korpopmap5$남자_명 <- ifelse(korpopmap5$codecode %in% 
                            service$codecode, service$`2015_useage`, NA)
Seoul2=submap(korpopmap5,"서울")
qtm(Seoul2,"남자_명")


#servicev 2016 useage










