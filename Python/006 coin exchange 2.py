money,m50000,m10000,m5000,m1000=0,0,0,0,0

money=int(input('교환할 돈은 얼마? '))

m50000=money//50000
money%=50000

m10000=money//10000
money%=10000

m5000=money//5000
money%=5000

m1000=money//1000
money%=1000

print('5만원짜리 ==> %d 개' %m50000)
print('1만원짜리 ==> %d 개' %m10000)
print('5천원짜리 ==> %d 개' %m5000)
print('1천원짜리 ==> %d 개' %m1000)
print(' 바꾸지 못한 잔돈 ==> %d 원 \n' %money)
