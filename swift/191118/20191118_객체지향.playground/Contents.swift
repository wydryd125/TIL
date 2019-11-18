import UIKit


/* 1. 다음과 같은 속성(Property)과 행위(Method)를 가지는 클래스 만들어보기.
   구현 내용은 자유롭게
 
 ** 강아지 (Dog)
 - 속성: 이름, 나이, 몸무게, 견종
 - 행위: 짖기, 먹기
 */
 
class Dog {
    var dogName = "댕댕이"
    var dogAge = 3
    var dogweighe = "10kg"
    var dogType = "Mix"
    
    func bark() {
        print("짖다")
    }
    func eat() {
        print("먹다")
    }
}
let daengdaeng = Dog()
daengdaeng.bark()
daengdaeng.dogName
daengdaeng.dogAge
daengdaeng.dogType

/* 학생 (Student)
- 속성: 이름, 나이, 학교명, 학년
- 행위: 공부하기, 먹기, 잠자기 */

class student {
    var studentName: String
    var studentAge: Int
    var school: String
    var grade: String
    
    func study() {
        print("공부하다")
    }
    func eat() {
        print("먹다")
    }
    func sleep() {
        print("자다")
    }

init(studentName:String, studentAge:Int, school:String, grade:String) {
    self.studentName = studentName
    self.studentAge = studentAge
    self.school = school
    self.grade = grade
    }
}
let student1 = student(studentName: "유꽁", studentAge: 28, school: "fastcampus", grade: "1학년")
student1.school
student1.eat()
student1.studentAge
student1.grade

 
 
 /* 아이폰(IPhone)
- 속성: 기기명, 가격, faceID 기능 여부(Bool)
- 행위: 전화 걸기, 문자 전송 */

class Iphone {
    var device: String
    var price: Int
    var faceID: Bool
    
    init(device: String, price: Int, faceID: Bool) {
        self.device = device
        self.price = price
        self.faceID = faceID
        
    }
    func call() {
        print("전화하다")
    }
    func SMS() {
        print("문자하다")
    }
}
let newIphone = Iphone(device: "아이폰11", price: 99, faceID: true)
newIphone.device
newIphone.price
newIphone.faceID
newIphone.SMS()
newIphone.call()



/*  커피(Coffee)
- 속성: 이름, 가격, 원두 원산지 */
class Coffee {
    var coffeeName: String
    var coffeePrice: Int
    var coffeeOrigin: String
    
    init(coffeeName: String, coffeePrice: Int, coffeeOrigin: String) {
        self.coffeeName = coffeeName
        self.coffeePrice = coffeePrice
        self.coffeeOrigin = coffeeOrigin
        
    }
}
let myCoffee = Coffee(coffeeName: "루왁커피", coffeePrice: 5500, coffeeOrigin: "인도네시아")
myCoffee.coffeeName
myCoffee.coffeePrice
myCoffee.coffeeOrigin




/* 2. 계산기 클래스를 만들고 다음과 같은 기능을 가진 Property 와 Method 정의해보기
 
 ** 계산기 (Calculator)
 - 속성: 현재 값
 - 행위: 더하기, 빼기, 나누기, 곱하기, 값 초기화
 
 ex)
 let calculator = Calculator() // 객체생성
 
 calculator.value  // 0
 calculator.add(10)    // 10
 calculator.add(5)     // 15
 
 calculator.subtract(9)  // 6
 calculator.subtract(10) // -4
 
 calculator.multiply(4)   // -16
 calculator.multiply(-10) // 160
 
 calculator.divide(10)   // 16
 calculator.reset()      // 0 */

class Calculator {
    var value: Int
    
    init(value: Int) {
        self.value = value
        
    }
    func add(a: Int) -> Int {
        value += a
        return value
    }
    func subtract(a: Int) -> Int {
        value -= a
        return value
    }
    func multiply(a: Int) -> Int {
        value *= a
        return value
    }
    func divide(a: Int) -> Int {
        value /= a
        return value
    }
    func reset() -> Int {
        value *= 0
        return value
    }
    
}
let calculator = Calculator(value: 0)

calculator.value  // 0
calculator.add(a: 10)    // 10
calculator.add(a: 5)     // 15

calculator.subtract(a: 9)  // 6
calculator.subtract(a: 10) // -4

calculator.multiply(a: 4)   // -16
calculator.multiply(a: -10) // 160

calculator.divide(a: 10)   // 16
calculator.reset()      // 0 */



/*3. 첨부된 그림을 참고하여 각 도형별 클래스를 만들고 각각의 넓이, 둘레, 부피를 구하는 프로퍼티와 메서드 구현하기 */

//정사각형
class Square {
    var s: Int
    
    init(s:Int) {
        self.s = s
    }
    func area() -> Int {
        return s * s
    }
    func perimeter() -> Int {
        return s + s + s + s
    }
}
let square = Square(s: 6)
square.area()
square.perimeter()

//직사각형
class Rectangle {
    var w: Int
    var l: Int
    
    init(w: Int, l: Int) {
        self.w = w
        self.l = l
    }
    func area() -> Int {
        return w * l
    }
    func perimeter() -> Int {
        return (2*l)+(2*w)
    }
}
let rectangle = Rectangle(w: 5, l: 7)
rectangle.area()
rectangle.perimeter()

//원
class Circle {
    var r: Double
    var pie = 3.14
    
    init(r: Double) {
        self.r = r
    }
    func area() -> Double {
        return pie * r * r
    }
    func circumference() -> Double {
        return 2 * pie * r
    }
}
let circle = Circle(r: 5)
circle.area()
circle.circumference()

//삼각형
class Triangle {
    var b: Double
    var h: Double
    
    init(b: Double, h: Double) {
        self.b = b
        self.h = h
    }
    func area() -> Double {
        return Double(b * h / 2)
    }
}
let triangle = Triangle(b: 5, h: 7)
triangle.area()


//사다리꼴
class Trapezoid {
    var a: Double
    var b: Double
    var h: Double
    
    init(a: Double, b: Double, h: Double) {
        self.a = a
        self.b = b
        self.h = h
    }
    func area() -> Double {
        return (a + b) * (h / 2)
    }
}
let trapezoid = Trapezoid(a: 8, b: 4, h: 3)
trapezoid.area()

// 정육면체
class Cube {
    var s: Int
    
    init(s: Int) {
        self.s = s
    }
    func volume() -> Int {
        return s * s * s
  }
}
let cube = Cube(s: 3)
cube.volume()

// 직육면체
class RectangleSolid {
    var w: Int
    var l: Int
    var h: Int
    
    init(w: Int, l: Int, h: Int) {
        self.w = w
        self.l = l
        self.h = h
    }
    func volume() -> Int {
        return l * w * h
    }
}
let rectangleSolid = RectangleSolid(w: 3, l: 7, h:2)
rectangleSolid.volume()

//원기둥
class CircularCylinder {
    var r: Double
    var pie = 3.14
    var h: Double
    
    init(r: Double, h: Double) {
        self.r = r
        self.h = h
    }
    func volume() -> Double {
        return pie * r * r * h
    }
}
let circleCylinder = CircularCylinder(r: 3, h:8)
circleCylinder.volume()


//구
class Sphere {
    var r: Double
    var pie = 3.14
    
    init(r: Double) {
        self.r = r
    }
    func volume() -> Double {
        return 4/3 * pie * r * r * r
    }
}
let sphere = Sphere(r: 5)
sphere.volume()


//원뿔
class Cone {
    var r: Double
    var pie = 3.14
    var h: Double
    
    init(r: Double, h: Double) {
        self.r = r
        self.h = h
    }
    func volume() -> Double {
        return 1/3 * pie * r * r * h
    }
    
}
let cone = Cone(r: 2, h: 6)
cone.volume()
