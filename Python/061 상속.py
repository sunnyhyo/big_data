class Car:
    color =''
    speed=0

    def __init__(self):
        self.color='빨강'
        self.speed=0

    def upSpeed(self, value):
        self.speed+=value
    def downSpeed(self, value):
        self.speed-=value

myCar1=Car()
myCar2=Car()

print('자동차 1의 색상은 %s이며, 현재 속도는 %d km 입니다. ' %( myCar1.color, myCar1.speed))

print('자동차 2의 색상은 %s이며, 현재 속도는 %d km 입니다. ' %( myCar2.color, myCar2.speed))
