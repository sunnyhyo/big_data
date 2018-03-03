num=input('주민등록번호 입력 : ')

if (int(num[:-6])==1 or int(num[:-6])==3):
    print('남자입니다')
    
else:
    print('여자입니다')
