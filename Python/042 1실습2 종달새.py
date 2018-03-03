import random

time=random.randrange(0,24)
wether=[True, False]


print('시간 %d, 날씨화창한가? :%s'%(time, wether))

if 6<=time<=9:
    if wether=='True':
        print('종달새가 노래를 부릅니다')
    else:
        print('종달새가 노래를 부르지 않습니다')
else:
    print('종달새가 노래를 부르지 않습니다')
