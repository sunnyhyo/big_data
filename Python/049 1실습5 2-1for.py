
a = int(input('출력하고 싶은 단을 입력하세요'))

i,k=0,0

for i in range (2, 10):
    for k in range(1, 10,1):
        if i!=a:
            continue
        print( '%dX%d=%d ' %(i, k , i*k))
