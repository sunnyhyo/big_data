#데이터 분석 프로젝트
#한국복지패널데이터
#패키지 준비하기
library(foreign)
library(dplyr)
library(ggplot2)
library(readxl)
#데이터 불러오기
setwd('c:\\easy_r')
raw_welfare<- read.spss(file='Koweps_hpc10_2015_beta1.sav',
                        to.data.frame=T)
#복사본 만들기
welfare <-raw_welfare
#데이터 검토하기
head(welfare)
tail(welfare)
dim(welfare)
summary(welfare)
#변수명 바꾸
welfare <- rename(welfare, 
                  sex= h10_g3, 
                  birth= h10_g4, 
                  marriage= h10_g10,
                  religion= h10_g11, 
                  income= p1002_8aq1, 
                  code_job= h10_eco9,
                  code_region=h10_reg7)
#05 연령대 및 성별 월급 차이
#1. 연령대 및 성별 월급 평균표 만들기
sex_income <- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg, sex) %>% 
  summarise(mean_income=mean(income))
sex_income
#2. 그래프 만들기 
ggplot(data=sex_income, aes(x=ageg, y=mean_income, fill=sex))+
  geom_col()+scale_x_discrete(limits=c('young','middle','old'))
#성별 막대 분리
ggplot(data= sex_income, aes(x=ageg, y=mean_income, fill=sex))+
  geom_col(position='dodge')+
  scale_x_discrete(limits=c('young','middle','old'))


#나이 및 성별 월급 차이분석하기
#1. 성별 연령별 월급평균표 만들기
sex_age <-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age,sex) %>% 
  summarise(mean_income=mean(income))
head(sex_age)
#2. 그래프 만들기
ggplot(data=sex_age, aes(x=age, y=mean_income, col=sex))+geom_line()
