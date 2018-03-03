a=input('16진수 한 글자를 입력하세요. ')


if (a>='0' and a<='9') or (a>='A' and a<='F') or (a>='a' and a<='f'):
    print('10진수==> %d' %int(a,10) )


else:
    print('16진수가 아닙니다')
