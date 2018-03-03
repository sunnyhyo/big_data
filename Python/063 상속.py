
class father:
    s_name='서주원'
    def intro(self):
        print('나는 %s 의 아빠입니다' %self.s_name)

class tall:
    height=180
    def hgt(self):
        print('제 키는 %s cm입니다 '%self.height)

class child(father.tall):
    name='서진수'
    def hello(self):
        print('안녕하세요 %s 입니다 '%seld.name)

jinsu =child()
jinsu.hello()
jinsu.hgt()
jinsu.intro()

