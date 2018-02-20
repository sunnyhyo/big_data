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

#04연령대에 따른 월급 차이
#연령대 변수 검토 및 전처리하기 
#파생변수 만들기 - 연령대
welfare <-welfare %>% 
  mutate(ageg=ifelse(age<30, 'young', 
                     ifelse(age<=59, 'middle', 'old')))
table(welfare$ageg)
#1.연령대별 월급 평균표 만들기
ageg_income <-welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(ageg) %>% 
  summarise(mean_income=mean(income))
#2. 그래프 만들기
ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+geom_col()
#막대 정렬: 초년 중년 나이 
ggplot(data=ageg_income, aes(x=ageg, y=mean_income))+geom_col()+
  scale_x_discrete(limits= c('young','middle','old'))
