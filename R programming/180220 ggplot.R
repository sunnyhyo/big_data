install.packages('ggplot2')
library(ggplot2)
mpg
ggplot(data=mpg , aes(x=cty, y=hwy)) + 
  geom_point() 

midwest
ggplot(data=midwest, aes(x=poptotal, y=popasian))+ geom_point()+ 
  xlim(0,500000) + ylim(0,10000)
install.packages('dplyr')
library(dplyr)

#��ո��� �׷��� - ��� ����������
df_mpg<- mpg %>% 
  group_by(drv) %>% 
  summarise(mean_hwy=mean(hwy))
ggplot(data=df_mpg, aes(x=drv, y=mean_hwy))+ geom_col()
ggplot(data=df_mpg, aes(x=reorder(drv,-mean_hwy), y=mean_hwy))+geom_col()
#�󵵸��� �׷��� - ���ڷḦ �̿�
ggplot(data=mpg, aes(x=drv))+ geom_bar()
ggplot(data=mpg, aes(x=hwy))+ geom_bar()


#ȥ�ڼ� �غ���
q1_mpg<- mpg %>%
  filter(class=='suv') %>% 
  group_by(manufacturer) %>% 
  summarise(mean_cty=mean(cty)) %>% 
  arrange(desc(mean_cty)) %>% 
  head(5)
q1_mpg
ggplot(data=q1_mpg, aes(x=reorder(manufacturer,-mean_cty), y=mean_cty))+geom_col()

ggplot(data=mpg, aes(x=class))+geom_bar()


#���׷���
economics
ggplot(data=economics, aes(x=date, y=unemploy))+geom_line()

#ȥ���غ���
ggplot(data=economics, aes(x=date, y=psavert))+geom_line()

#���ڱ׸� �����
ggplot(data=mpg, aes(x=drv, y=hwy))+ geom_boxplot()
#ȥ�ڼ� �غ���
q1_p198_mpg <- mpg %>% 
  filter(class %in% c('compact','subcompact','suv'))
ggplot(data=q1_p198_mpg , aes(x=class, y=cty))+geom_boxplot()








