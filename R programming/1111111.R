install.packages('foreign')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('readxl')
install.packages('plotly')
install.packages('dygraphs')
install.packages('xts')
install.packages('corrplot')

library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
library(plotly)
library(dygraphs)
library(xts)
library(corrplot)

setwd('c:\\easy_r')
aaa<- read.csv('useage_2016_gwanakgu.csv')
df_dataset<- aaa
df_dataset$day<- as.character(df_dataset$day)
df_dataset$date<- as.Date(df_dataset$date)

#요일별 이용실적
df_day_useage<- df_dataset %>% 
  group_by(day) %>% 
  summarise(mean_useage= mean(useage, na.rm=T))
df_day_useage

#요일별 HISTOGRAM
g_1<- ggplot(data=df_day_useage, aes(x=day, y=mean_useage, fill=day))+ 
  geom_col()+
  scale_x_discrete(limits= c('월','화','수','목','금','토','일'))+
  scale_fill_discrete(limits= c('월','화','수','목','금','토','일'))
g_1
ggplotly(g_1)

#결측치 제거
df_date_useage <- df_dataset %>% 
  filter(!is.na(useage))
df_date_useage

#산점도 시계열그래프
g_2<- ggplot(data=df_date_useage, aes(x=date, y=useage))+
  geom_point()+
  geom_line()+
  ylim(0,100)
g_2
ggplotly(g_2)

weather <- read.csv('wether_2016_seoul.csv') 
weather<- rename(weather,
                 date=날짜,
                 avg_tem=평균기온,
                 highest_tem=최고기온,
                 lowest_tem=최저기온,
                 avg_cloud=평균운량,
                 daily_rain=일강수량)


df_weather<- data.frame(date=weather$date,
                        avg_tem=weather$avg_tem,
                        highest_tem=weather$highest_tem,
                        lowest_tem=weather$lowest_tem) 
df_weather$date<- as.Date(df_weather$date)
df_weather$avg_tem<- as.character(df_weather$avg_tem)
df_weather$highest_tem<- as.character(df_weather$highest_tem)
df_weather$lowest_tem<- as.character(df_weather$lowest_tem)

fuc<- function(x){
  sub('\\℃', '', x)
}
a<-df_weather$avg_tem
b<-df_weather$highest_tem
c<-df_weather$lowest_tem
df_weather$avg_tem<- fuc(a)
df_weather$highest_tem<- fuc(b)
df_weather$lowest_tem<- fuc(c)

df_weather$avg_tem<- as.numeric(df_weather$avg_tem)
df_weather$highest_tem<- as.numeric(df_weather$highest_tem)
df_weather$lowest_tem<- as.numeric(df_weather$lowest_tem)


#df_all_dataset
df_all_dataset<- left_join(df_dataset, df_weather, by='date')
df_all_dataset


df_all_dataset <- df_all_dataset %>% 
  mutate(Tem = ifelse(avg_tem <0 , 'cold',
                      ifelse(avg_tem <=15, 'cool',
                             ifelse(avg_tem <=25 ,'mild','hot'))))
head(df_all_dataset)
table(df_all_dataset$Tem)

df_Tem_useage<-df_all_dataset %>%
  filter(!is.na(useage)) %>% 
  group_by(Tem) %>% 
  summarise(sum_useage=sum(useage))

g_7<- ggplot(data= df_Tem_useage, aes(x=Tem, y=sum_useage))+
  geom_col()+
  scale_x_discrete(limits= c('cold', 'cool','mild','hot'))

g_7
ggplotly(g_7)


