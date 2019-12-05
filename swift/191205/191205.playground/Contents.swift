/******************
 ** Type Casting **
 ******************
 [ 과제 ]
 1.
 func addTwoValues(a: Int, b: Int) -> Int {
 return a + b
 }
 let task1: Any = addTwoValues(a: 2, b: 3)
 위와 같이 정의된 변수 task1이 있을 때 다음의 더하기 연산이 제대로 동작하도록 할 것
 task1 + task1  */

func addTwoValues(a: Int, b: Int) -> Int {
    return a + b
}
let task1: Any = addTwoValues(a: 2, b: 3)

// 강제 타입캐스팅
(task1 as! Int) is Int
let task = task1 as! Int
print(task + task)


//
if let task2 = task1 as? Int {
    print(task2 + task2)
}





/* [ 도전 과제 ]
 
 1.
 let task2: Any = addTwoValues
 과제 1번에 이어 이번에는 위와 같이 정의된 task2 변수에 대해
 두 변수의 더하기 연산이 제대로 동작하도록 할 것
 (addTwoValues의 각 파라미터에는 원하는 값 입력)
 task2 + task2 */

/* 2.
 class Car {}
 let values: [Any] = [
 0,
 0.0,
 (2.0, Double.pi),
 Car(),
 { (str: String) -> Int in str.count }
 ]
 위 values 변수의 각 값을 switch 문과 타입캐스팅을 이용해 출력하기
 for value in values {
 switch value {
 // Code 구현
 }
 } */


/*****************
 ** Initializer **
 *****************
 
 [ 과제 ]
 
 1. 생성자 구현
 - Vehicle 클래스에 지정 이니셜라이져(Designated Initializer) 추가
 - Car 클래스에 modelYear 또는 numberOfSeat가 0 이하일 때 nil을 반환하는 Failable Initializer 추가
 - Bus 클래스에 지정 이니셜라이져를 추가하고, maxSpeed를 100으로 기본 할당해주는 편의 이니셜라이져 추가
 class Vehicle {
 let name: String
 let maxSpeed: Int
 }
 class Car: Vehicle {
 var modelYear: Int
 var numberOfSeats: Int
 }
 class Bus: Vehicle {
 let isDoubleDecker: Bool
 }  */

class Vehicle {
    let name: String
    var maxSpeed: Int
    init() {
        name = "타요타요내심장이타요"
        maxSpeed = 8282
    }
    
}

class Car: Vehicle {
    var modelYear: Int
    var numberOfSeats: Int
    
    init?(modelYear: Int, numberOfSeats: Int) {
        guard modelYear > 0 || numberOfSeats > 0 else { return nil }
        self.modelYear = modelYear
        self.numberOfSeats = numberOfSeats
    }
    
}


class Bus: Vehicle {
    let isDoubleDecker: Bool
    
    init(isDoubleDecker: Bool) {
        
        self.isDoubleDecker = isDoubleDecker
        super.init()
    }
    
    
    convenience override init() {
        self.init(isDoubleDecker: true)
        self.maxSpeed = 100
        
        
    }
}





