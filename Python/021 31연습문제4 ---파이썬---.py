ss=input('문자열 입력==>')
print('출력 문자역==>', end="")   ## end="" 옆으로 출력##

if ss.startswith('---')==False:
    print("---", end="")

print(ss, end="")

if ss.endswith('---')==False:
    print("---",end='')
