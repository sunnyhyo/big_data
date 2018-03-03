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

##08 종교 유무에 따른 이혼율- 종교가 있는 사람들이 이혼을 덜할까?
#종교 변수 검토,전처리
#1. 변수 검토하기
class(welfare$religion)
table(welfare$religion)
#2. 전처리
#종교 유무 이름 부여
welfare$religion <-ifelse(welfare$religion==1, 'yes', 'no')
table(welfare$religion)
qplot(welfare$religion)
#혼인상태변수 검토,전처리
#1. 변수 검토하기
class(welfare$marriage)
table(welfare$marriage)
#2. 전처리
#이혼여부 변수 만들기
welfare$group_marriage <-ifelse(welfare$marriage ==1, 'marriage', 
                                ifelse(welfare$marriage==3, 'divorce',NA))
table(welfare$group_marriage)
table(is.na(welfare$group_marriage))
#1.종교 유무에 따른 이혼율 표 만들기
religion_marriage <-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group =sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
religion_marriage
#2.이혼율 표 만들기
#이혼 추출
divorce <-religion_marriage %>% 
  filter(group_marriage=='divorce') %>% 
  select(religion, pct)
divorce
#3. 그래프 만들기
ggplot(data=divorce, aes(x=religion, y=pct))+ geom_col()

# 연령대 및 종교 유무에 따른 이혼율 분석하기
#1. 연령대별 이혼율 표 만들기
ageg_marriage <-welfare %>% 
  filter(!is.na(group_marriage)) %>% 
  group_by(ageg, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group=sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
ageg_marriage
#2. 연령대별 이혼율 그래프 만들기
#초년 제외, 이혼 추출
ageg_divorce<- ageg_marriage %>% 
  filter(ageg != 'young' & group_marriage =='divorce') %>% 
  select(ageg, pct)
ageg_divorce
#그래프 만들기
ggplot(data=ageg_divorce, aes(x=ageg, y=pct))+geom_col()
#3. 연령대 및 종교 유무에 따른 이혼율 표 만들기
#연령대, 종교유무, 결혼 상태별 비율표 만들기
ageg_religion_marriage <-welfare %>% 
  filter(!is.na(group_marriage) & ageg!='young') %>% 
  group_by(ageg, religion, group_marriage) %>% 
  summarise(n=n()) %>% 
  mutate(tot_group =sum(n)) %>% 
  mutate(pct=round(n/tot_group*100,1))
ageg_religion_marriage
#연령대 및 종교 유무별 이혼율 표 만들기
df_divorce <-ageg_religion_marriage %>% 
  filter(group_marriage=='divorce') %>% 
  select(ageg, religion, pct)
df_divorce
#4. 연령대 및 종교 유무에 따른 이혼율 그래프 만들기
ggplot(data=df_divorce, aes(x=ageg, y=pct, fill=religion)) +
  geom_col(position='dodge')
