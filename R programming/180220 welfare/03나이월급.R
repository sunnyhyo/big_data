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

#03나이와 월급의 관계 
#1. 변수 검토하기
class(welfare$birth)
summary(welfare$birth)
qplot(welfare$birth)
#2. 전처리 
#이상치 확인
summary(welfare$birth)
#결측치 확인
table(is.na(welfare$birth))
#이상피 결측 처리
welfare$birth <-ifelse(welfare$birth ==9999, NA, welfare$birth)
table(is.na(welfare$birth))
#3. 파생변수 만들기 - 나이
welfare$age <-2018 - welfare$birth + 1
summary(welfare$age)
qplot(welfare$age)
#나이와 월급의 관계분석하기
#1. 나이에 따른 월급 평균표 만들기
age_income <-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(age) %>% 
  summarise(mean_income=mean(income))
head(age_income)
#2. 그래프 만들기
ggplot(data=age_income, aes(x=age, y=mean_income)) +geom_line()