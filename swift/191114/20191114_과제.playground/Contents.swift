import UIKit

//[ 과제 ]
/*1. 옵셔널 타입의 문자열 파라미터 3개를 입력받은 뒤, 옵셔널을 추출하여 Unwrapped 된 하나의 문자열로 합쳐서 반환하는 함수

func combineString(str1: String?, str2: String?, str3: String?) -> String {
  // code
}

// 입력 예시 및 결과
combineString1(str1: "AB", str2: "CD", str3: "EF")   // "ABCDEF"
combineString1(str1: "AB", str2: nil, str3: "EF")    // "ABEF"  */




func combineString(str1: String?, str2: String?, str3: String?) -> String {
    if let st1 = str1, let st2 = str2, let st3 = str3 {
        return(st1 + st2 + st3)
    } else {
        return "다시 작성 해주십시오오오오옹"
    }
}
print(combineString(str1: "안녕 ", str2: "나는 ", str3: "유경!!!💪🏻🐹"))



/*2. 사칙연산(+, -, *, /)을 가진 enum 타입 Arithmetic과 2개의 자연수를 입력 파라미터로 받아 (파라미터 총 3개) 해당 연산의 결과를 반환하는 함수 구현
enum Arithmetic {
  case addition, subtraction, multiplication, division
}   */

enum Arithmetic{
    case addition, subtraction, multiplication, division
    
    func number(a: Int, b: Int ) -> Int {
        switch self {
        case .addition:
            return a + b
        case .subtraction:
            return a - b
        case .multiplication:
            return a * b
        case .division:
            return a / b
        }
    }
}

var multiply = Arithmetic.multiplication.number(a: 3, b: 2)





/*[ 도전 과제 ]
1. celcius, fahrenheit, kelvin 온도 3가지 케이스를 가진 enum 타입 Temperature 를 정의
각 케이스에는 Double 타입의 Associated Value 를 받도록 함

추가로 Temperature 타입 내부에 각 온도를 섭씨 온도로 변환해주는 toCelcius() 함수를 구현
섭씨 = (화씨 - 32) * 5 / 9
섭씨 = 켈빈 + 273
 
enum Temperature {
  // 코드
} */



/* 2. 다음 ArithmeticExpression 의 각 케이스별로 연산을 수행하고 그 값을 반환하는 evaluate 함수 구현

enum ArithmeticExpression {
  case number(Int)
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}

let five = ArithmeticExpression.number(5)
let four = ArithmeticExpression.number(4)
let sum = ArithmeticExpression.addition(five, four)
let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

func evaluate(_ expression: ArithmeticExpression) -> Int {
  // 코드
}


evaluate(five)    // 결과 : 5
evaluate(sum)     // 결과 : 9
evaluate(product) // 결과 : 18  */


