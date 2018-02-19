fruit2<-read.table('fruits_2.txt', skip=2) #주석문도 skip대상
fruit2

fruits3<-read.table('fruits.txt', header=T, nrow=2)
fruits3

fruits3<-read.table('fruits.txt', header=F, skip=2, nrows=2)
for(i in 1:length(loc2)){
 if (loc2[i]=='구'){
   colors<-c(colors,'red')}
  else{
  colors<-c(colors, 'blue')}
}
