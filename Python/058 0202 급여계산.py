

time=int(input('근로시간 입력'))
wage=int(input('시간당 임금 입력'))


import calc_monthly_salary


print(calc_monthly_salary.salary(time, wage))
