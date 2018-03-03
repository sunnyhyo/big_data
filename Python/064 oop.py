student = {'name': '홍길동', 'year': 2,'class':3, 'student_id':35}

print( '{}, {}학년 {}반 {}번'.format(student['name'], student['year'], student['class'], student['student_id']))



class student(object):
    def __init__(self,name, year, class_num, student_id):
        self.name=name
        self.year=year
        self.class_num=class_num
        self.student_id=student_id

    def introduce_myself(self):
        return ('{}, {}학년 {}반 {}번'.format(self.name, self.year, self.class_num, self.student_id))
student=student('홀길동',2,3,36)
print(student.introduce_myself())
