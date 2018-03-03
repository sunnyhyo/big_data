def calc(v1,v2,op):
    result =0
    if op=='+':
        result = v1 +v2
    elif op=='-':
        result = v1- v2
    elif op=='*':
        result= v1*v2
    elif op == '/':
        result=v1/v2
    elif op == '**':
        result=v1**v2
    return result

res =0
var1, var2, oper=0,0, " "

var1= float(input('첫번째 숫자 입력:'))
oper =input('계산 입력(+,-,/,*,**)')
var2= float(input('두번째 숫자 입력:'))



if oper=='/' and var2==0:
    print('불가능합니다')
else:
    res=calc(var1, var2, oper)
    print('##계산기: %d %s %d =%5.2f '%(var1,oper,var2,res))
