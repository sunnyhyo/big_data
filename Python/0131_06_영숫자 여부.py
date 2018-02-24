a=input('입력')

if a.isalpha():
    print('글자입니다')
elif a.isdigit():
    print('숫자입니다')
elif a.isalnum():
    print('영숫자입니다')
else:
    print('모르겠습니다')
    
