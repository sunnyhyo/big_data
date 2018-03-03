import random

a=random.randrange(1,6)
b=random.randrange(1,6)


print('A 주사위 : %d, B 주사위 : %d'%(a,b))

if a>b:
    print( 'A가 이겼습니다.')
elif b>a:
    print( 'B가 이겼습니다.')
else:
    print('무승부 입니다')
