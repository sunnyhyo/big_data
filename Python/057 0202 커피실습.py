def coffee_machine(button):
    print()
    print('#1. (자동으로)뜨거운 물을 준비한다')
    print('#2. (자동으로)컵을 준비한다.')
    if coffee==1 :
        print('#3. (자동으로)아메리카노를 탄다.')
    elif coffee==2 :
        print('#3. (자동으로)카페라떼를 탄다.')
    elif coffee==3 :
        print('#3. (자동으로)카푸치노를 탄다.')
    elif coffee==4 :
        print('#4. (자동으로)에스프레소를 탄다.')
    elif client :
        print('#3. 아무거나  탄다\n.')
    print('#4. 물을 붓는다')
    print('#5. 스푼으로 저어서 녹인다');
    print()

    

coffee=int(input('어떤 커피 드릴까요? (1: 보통, 2:설탕, 3:블랙)'))
coffee_machine(coffee)
