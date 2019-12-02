//: [Previous](@previous)
/***************************************************
 "Hello, World!" 문자열을 출력하기 위한 코드 작성
 ***************************************************/

print("Hello, World!")

/***************************************************
 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
 ***************************************************/

func addTwoNumbers(num1: Int, num2: Int) -> Int {
  num1 + num2
}
addTwoNumbers(num1: 5, num2: 10)

/***************************************************
 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
 ***************************************************/

func multiplyTwoNumbers(num1: Int, num2: Int) -> String {
  String(num1 * num2)
}
multiplyTwoNumbers(num1: 2, num2: 3)


/***************************************************
 주어진 숫자가 짝수인지 여부를 판단하는 함수 작성 (switch 문으로 해결)
 ***************************************************/

func isEven(num: Int) -> Bool {
  switch num % 2 {
  case 0: return true
  default: return false
  }
}

isEven(num: 10)
isEven(num: 5)


/***************************************************
 Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
 ***************************************************/

var sum = 0
for i in 1...10 {
    sum += i

}
sum


//var sum = 0
//for i in 1...10 {
//  sum += i
//}
//sum
//
//var a = 1
//var count = 0
//while a < 11 {
//    count += a
//    a += 1
//}
//count
//
//var i = 1
//var temp = 0
//while i < 11 {
//    temp += i
//    i += 1
//}
//temp



//
//var i = 1
//sum = 0
//while i <= 10 {
//  sum += i
//  i += 1
//}
//sum

//
//i = 1
//sum = 0
//repeat {
//  sum += i
//  i += 1
//} while i <= 10
//sum


var a = 1
var temporary = 0
repeat {
    temporary += a
    a += 1
} while a < 11

temporary




/***************************************************
 Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지, 그리고 그 특징에 대해 설명
 ***************************************************/

/*
 [ Pascal Case (upper camel case) ]
 - 파일명, 프로젝트명과 클래스명, 프로토콜명 같이 각 타입 이름 등에 사용
 - 첫 알파벳을 대문자로 시작하고 이후 각 단어의 첫 알파벳만을 대문자로 하여 구분
 e.g. ViewController, Int, String
 
 [ Camel Case (lower camel case) ]
 - 변수명, 메서드명, enum 의 각 케이스 네이밍 등에 사용
 - 첫 알파벳을 소문자로 시작하고 이후 각 단어의 첫 알파벳만을 대문자로 하여 구분
 e.g. viewWillAppear(), viewDidLoad()
 */



/***************************************************
 사전 지식 테스트 때 위 내용들을 제대로 푸신 분이 거의 없었는데
 지금은 대부분 많이 쉽죠?
 그만큼 많이 발전하셨습니다. :)
 ***************************************************/

//: [Next](@next)
