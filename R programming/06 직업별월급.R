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




##06 직업별 월급 차이- 어떤 직업이 월급을 가장 많이 받을까
#1. 변수 검토하기
class(welfare$code_job)
table(welfare$code_job)
#2. 전처리
library(readxl)
list_job <-read_excel('Koweps_Codebook.xlsx', col_names= T, sheet=2)
head(list_job)
dim(list_job)
#welfare에 직업명 결합
welfare <-left_join(welfare, list_job, id = 'code_job')
welfare %>% 
  filter(!is.na(code_job)) %>% 
  select(code_job, job) %>% 
  head(10)
##직업별 월급 평균표 만들기
#1. 직업별 월급 평균표 만들기
job_income<-welfare %>% 
  filter(!is.na(job) & !is.na(income)) %>% 
  group_by(job) %>% 
  summarise(mean_income=mean(income))
head(job_income)
#2. 상위 10개 추출
top10 <-job_income %>% 
  arrange(desc(mean_income)) %>% 
  head(10)
top10
#3. 그래프 만들기
ggplot(data=top10, aes(x=reorder(job, mean_income), y=mean_income))+ 
  geom_col()+
  coord_flip()
#4. 하위 10위 추출
bottom10 <-job_income %>% 
  arrange(mean_income) %>% 
  head(10)
bottom10
#5. 그래프 만들기
ggplot(data=bottom10, aes(x=reorder(job, -mean_income), y=mean_income))+
  geom_col()+
  coord_flip()+
  ylim(0,850)