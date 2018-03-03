#데이터 분석 프로젝트
#한국복지패널데이터
#패키지 준비하기
install.packages('foreign')
install.packages('dplyr')
install.packages('ggplot2')
install.packages('readxl')
install.packages('gplot')
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
View(welfare)
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
#성별에 따른 월급 차이
#성별 변수검토,전처리
class(welfare$sex)
#이상치확인
table(welfare$sex)
#이상치결측확인
welfare$sex <-ifelse(welfare$sex ==9, NA, welfare$sex)
#결측치 확인
table(is.na(welfare$sex))
#성별 항목 이름 부여
welfare$sex<- ifelse(welfare$sex==1, 'male', 'femal')
table(welfare$sex)
qplot(welfare$sex)

#월급 변수검토,전처리
class(welfare$income)
summary(welfare$income)
qplot(welfare$income)
qplot(welfare$income)+xlim(0,1000)
#이상치 확인
summary(welfare$income)
#이상치 결측처리
welfare$income<-ifelse(welfare$income %in% c(0,9999), NA, welfare$income)
#결측치 확인
table(is.na(welfare$income))

#성별에 따른 월급차이 분석하기
#1. 성별 월급 평균표 만들기
sex_income<- welfare %>% 
  filter(!is.na(income)) %>% 
  group_by(sex) %>% 
  summarise(mean_income=mean(income))
sex_income
#2. 그래프 만들기
ggplot(data=sex_income, aes(x=sex, y=mean_income)) +geom_col()
