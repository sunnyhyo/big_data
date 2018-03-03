aa=0

while aa!='q':
    aa=input( '구입하려는 과일의 이름을 입력하세요. (입력을 종료하려면 q를 누르시오)')
    bb=int(input( '구입하려는 개수를 입력하세요'))
    if aa=='q':
        break


fruits=['사과', '포도', '배', '귤']
price=[1000,3000,2000,500]
total=[]

for i in range(0,len(fruits)):
    total.append(price[i]*aa)

print(total)
