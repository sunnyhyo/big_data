sel=int(input('입력진수 결정(16/10/8/2): '))
num=input('입력값')

if sel==16:
    num10=int(num,16)
if sel==10:
    num10=int(num,10)
if sel==8:
    num10=int(num,8)
if sel==2:
    num10=int(num, 2)

print('10진수 ==> ', num10)
