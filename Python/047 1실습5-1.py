for i in range (2, 10):
    print('')
    for k in range(1, 10,1):
        if i>=5:
            continue
        print( '%dX%d=%d ' %(i, k , i*k))
