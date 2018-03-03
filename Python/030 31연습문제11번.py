a=int(input('진수(16/10/8/2)를 선택하시오 : '))
num1=int(input('첫번째 수를 입력하시오'))
num2=int(input('두번째 수를 입력하시오'))


print('두 수의 & 연산결과')
result1=int(num1,a)&int(num2,a)
print('16진수=> ', hex(result1))
print('8진수 => ', result1)
print('10진수 => ', oct(result1))
print('2진수 => ', bin(result1))


