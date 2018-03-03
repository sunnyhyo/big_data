num1=input('16진수 한 글자를 입력하세요. ')

num2=ord(num1)

if ord('0') <= num2 <=ord('9'):
    print('10진수==>', int('num2',10) )
    
elif ord('a')<= num2 <=ord('f'):
    print('10진수==>'+ int('num2',10))

else:
    print('16진수가 아닙니다')
