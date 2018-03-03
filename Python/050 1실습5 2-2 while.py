a = int(input('출력하고 싶은 단을 입력하세요'))

i, j = 1,1
hap=1

while i < 9:
    i= i+1
    j=1

    while j<10:
        if i!=a:
            break
        hap=i*j
        print('%dX%d=%d' %(i, j, hap))
        j=j+1


        
        
