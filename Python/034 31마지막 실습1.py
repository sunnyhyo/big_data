a=int(input('첫번째 과목 점수를 입력하시오:'))
b=int(input('두번째 과목 점수를 입력하시오:'))
c=int(input('세번째 과목 점수를 입력하시오:'))

if a<40 or b<40 or c<40:
    print('과락')
elif (a+b+c)/3 >=60:
    print('합격')
else:
    print('불합격')
    
