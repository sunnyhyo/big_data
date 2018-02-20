setwd('c:\\easy_r')
exam<-read.csv('csv_exam.csv')
exam[c(3,8,15), 'math'] <-NA
exam


exam %>% summarise(mean_math=mean(math))
exam %>% summarise(mean_math=mean(math, na.rm=T))

exam %>% summarise(mean_math=mean(math), 
                   sum_math =sum(math), 
                   median_math=median(math))

exam %>% summarise(mean_math=mean(math, na.rm=T), 
                   sum_math =sum(math, na.rm=T), 
                   median_math=median(math, na.rm=T))

mean(exam$math, na.rm=T)
exam$math <- ifelse(is.na(exam$math), 55, exam$math)
table(is.na(exam$math))
is.na(exam$math)

#결측처리하기
outlier<-data.frame(sex=c(1,2,1,3,2,1), 
                     score=c(5,4,3,4,2,6))
outlier
table(outlier$sex)
table(outlier$score)
outlier$sex <-ifelse(outlier$sex ==3 , NA, outlier$sex)
outlier
outlier %>% 
  filter(!is.na(sex) & !is.na(score)) %>% 
  group_by(sex) %>% 
  summarise(mean_score = mean(score) )

#이상치 제거하기  2. 극단적인 값
mpg <-as.data.frame(ggplot2::mpg)
boxplot(mpg$hwy)
boxplot(mpg$hwy)$stats
#결측처리하기
mpg$hwy <-ifelse(mpg$hwy <12 | mpg$hwy >37, NA, mpg$hwy)
table(is.na(mpg$hwy))
#결측치 제외하고 분석하기
mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy, na.rm=T))

#혼자서 해보기
mpg<-as.data.frame(ggplot2::mpg)
mpg[c(10,14,58,93), 'drv']<-'k'
mpg[c(29,43,129,203), 'cty'] <-c(3,4,39,42)

mpg$drv <- ifelse(mpg$drv =='k', NA, mpg$drv)
table(is.na(mpg$drv))

boxplot(mpg$cty)
boxplot(mpg$cty)$stats
mpg$cty <- ifelse(mpg$cty<10, NA, mpg$cty)
table(is.na(mpg$cty))
boxplot(mpg$cty, na.rm=NA)


mpg %>% filter(!is.na(drv) &!is.na(cty)) %>% 
  group_by(drv) %>% 
  summarise(mean_cty=mean(cty))
