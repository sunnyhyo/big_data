for i in range(11,17):
    for k in range(1,10,1):
        if k <10:
            print(i*k, end=' ')
    if i !=i+1:
        print('\n', end='')
