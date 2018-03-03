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


##07 성별직업빈도 - 성별로 어떤 직업이 가장 많을까
#성별 직업 빈도 분석하기
#1. 성별 직업 빈도표 만들기
#남성 직업빈도 상위 10개 추출
job_male <-welfare %>% 
  filter(!is.na(job) & sex=='male') %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_male
#여성 직업빈도 상위 10개 추출
job_female<-welfare %>% 
  filter(!is.na(job) &sex=='female') %>% 
  group_by(job) %>% 
  summarise(n=n()) %>% 
  arrange(desc(n)) %>% 
  head(10)
job_female

#2. 그래프 만들기
#남성 직업빈도 상위 10개 직업
ggplot(data=job_male, aes(x=reorder(job, n), y=n)) +
  geom_col()+
  coord_flip()
#여성 직업빈도 상위 10개 직업
ggplot(data=job_female, aes(x=reorder(job, n), y=n))+
  geom_col()+
  coord_flip()
