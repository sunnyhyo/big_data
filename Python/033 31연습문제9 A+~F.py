grade=int(input('점수를 입력하시오'))

if grade >= 95 and grade<=100:
    print('A+')
elif grade >=90 and grade<95:
    print('A')
elif grade >=85 and grade<90:
    print('B+')
elif grade >=80 and grade<85:
    print('B')
elif grade >=75 and grade<80:
    print('C+')
elif grade >=70 and grade<75:
    print('C')
elif grade >=65 and grade<70:
    print('D+')
elif grade >=60 and grade<65:
    print('D')
else:
    print('F')

print('학점입니다')
