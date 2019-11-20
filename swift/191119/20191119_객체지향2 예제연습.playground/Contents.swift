import UIKit

//상속



class A {
    var name = "Class A"
  

    var description: String {
        return "This class name is \(self.name)"
    }
    func foo() {
        print("\(self.name)'s method foo is called")
    }
    
}
//클래스 초기화
let a = A() //-> 상수 a에는 클래스 A로 부터 만들어진 인스턴스가 할당
a.name
a.description
a.foo()


//서브클래싱 -> 클래스 A를 상속받아 새로운 클래스를 정의

class B: A { //->   클래스 이름 : 부모 클래스
    
    var prop = "Class B"
    
    func boo() -> String {
        return "Class B prop = \(self.prop)"
    }

}

let b = B()
b.prop
b.boo()
b.name
b.foo()
b.name = "Class C"
b.foo()

// class B에는 name 프로퍼티와 foo 메소드가 정의되어 있지 않음에도 불구하고 사용하고 있음. B가 A를 상속받았기 때문에.

class Vehicle {
    var currentSpeed = 0.0
    
    var description: String{
        return "시간당 \(self.currentSpeed)의 속도로 이동하고 있습니다."
    }
    func makeNoise() {
        
    }
}

let baseVehicle = Vehicle()
baseVehicle.description

class Bicycle: Vehicle {
    var hasBasket = false
}

let bicycle = Bicycle()
bicycle.hasBasket = true
bicycle.currentSpeed = 20.0//->currentSpeed에 20.0을 할당하여 부모 클래스인 vehicle의 연산 프로퍼티인 description 값을 변경시켜줌

print("자전거: \(bicycle.description)")


class Tandem: Bicycle {
var passengers = 0
}

let tandem = Tandem()
tandem.hasBasket = true
tandem.passengers = 2
tandem.currentSpeed = 14

print("Tandem : \(tandem.description)")


/*
 정리하자면...
 Vehicle > Bicycle > Tandem
 
 Vehicle - currentSpeed, description, MakeNois()
 Bicycle - hasBasket
 Tandem - passengers

 */
