from tkinter import *

##변수##
window=None
canvas=None
x1, y1, x2, y2 =None, None, None, None


##함수##
def mouseClick(event):
    global x1,y1,x2,y2
    x1=event.x
    y1=event.y
def mouseDrop(event):
    global x1,y1,x2,y2
    x2=event.x
    y2=event.y
    canvas.create_line(x1,y1,x2,y2, width=3, fill='blue')


##메인코드##
window=Tk()
window.title('그림판 비슷한 프로그램')
canvas=Canvas(window, height=300, width=300)
canvas.bind('<Button-1>',mouseClick)
canvas.bind('<ButtonRelease-1>',mouseDrop)

canvas.pack()
window.mainloop()                       
