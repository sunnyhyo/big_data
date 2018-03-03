instr,outstr='',''
ch=''
count,i=0,0

instr=input('문자열을 입력하세요:')
count=len(instr)

for i in range(0,count):
    ch=instr[i]    
    if (ord('A')<=ord(ch)<=ord('Z')):
        newCH=ch.lower()
    elif (ord('a')<=ord(ch)<=ord('z')):
          newCH=ch.upper()
    else:
        newCH=ch
    outstr+=newCH


print('대소문자 변환 결과-->%s' %outstr)



>>> type(ord('a'))
<class 'int'>
