import re

passw,idw,kname,ename,tel,hp,email,jumin,ip,sogae = '','','','','','','','','',''
r= re.compile( '[a-zA-Z0-9]+(.)[txt,pdf,hwp,xls]'    )##자기소개서 파일 정규식
while True :
    str = input("자기소개서 파일입력")
    if r.search(str) == None:
         print("잘못입력")
         continue
    else :
         sogae=str
         print(str)
         break
