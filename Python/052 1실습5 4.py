a = int(input('출력하고 싶은 단을 입력하세요'))


for i in range (1,10, 1):
    for k in range(9,0, -1):
        if i!=a:
            continue        
        print( '%dX%d=%d ' %(i, k , i*k))
