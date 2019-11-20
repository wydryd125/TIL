import UIKit

//반복문 - 특정 조건에 따라 특정 코드 블록을 반복적으로 실행 (for, while)
//For - 정해진 횟수만큼 주어진 코드 블록을 반복해서 실행

for row in 1...5 {
    print(row)
}

//for문을 이용하여 구구단
for i in 1...9 {
    print("2 x \(i) = \(2 * i)")
}

//for문을 이용하여 연도작성
for year in 1992...2019 {
    print("\(year)년도")
}

//for문을 이용한 문자열의 순회
var lang = "나는유꽁꽁꽁꽁"
for char in lang {
    print("\(char)")

}

//루프 상수의 생략 -> 언더바(_)
let size = 5
let padChar = "0"
var keyword = "3"

for _ in 1...size {
    keyword = padChar + keyword
}
print("\(keyword)")

//이중 for문으로 구구단 작성
for ii in 2..<10 {
    for jj in 1..<10 {
        print ("\(ii) x \(jj) = \(ii * jj)")
    }
}


//while문 - 조건을 만족하는 동안은 계속 실행, while에는 참이나 거짓을 반환하는 조건식이 사용 그래서 주로 비교 연산자가 사용

var n = 2
while n < 1000 {
    n = n * 2
}
print("n=\(n)")


//repeat while문 - 조건이 맞지 않아도 실행블록의 수행을 최소 한 번은 보장

repeat {
    n = n * 2
}
while n < 1000

print("n=\(n)")

//조건문 - 특정 조건이 성립할 경우 지정된 코드 블록이 실행되도록 제어

//if문 - 조건문은 반드시 bool타입을 판단할 수 있는 형태여야 함
var adult = 19
var age = 15

if age < adult {
    print("당신은 미성년자라구")
}

//if else - 조건이 참일때 A, 거짓일 때 B
var adult2 = 19
var age2 = 21

if age2 < adult2 {
    print("당신은 미성년자라구우우우웅")
} else {
    print("당신은 성인이라구우우웅")
}

//if의 중첩 -> 코드 심화로 인해 3단계 이상의 중첩 구문은 사용하지 않는게 좋다
var adult3 = 19
var age3 = 21
var gender = "M"

if adult3 > age3 {    // adult3과 age3의 값을 비교, 거짓이므로 else문으로 이동한다
    if gender == "M" {
        print("남자미성년")
    } else {
        print("여자미성년")
    }
} else {
    if gender == "M" {    // gender 값이 M이 맞으므로 else의 if가 출력하게 됨.
        print("남자성인")
    } else {
        print("여자성인")
    }
}

//if~else

var adult4 = 19

if adult4 == 17 {
    print("미성년")
} else if adult4 == 18 {
    print("미성년")
} else if adult4 == 19 {
    print("성년")
} else {
    print("늙은이")
}

//guard -> if와 비슷하지만 참일 때 실행되는 블록이 없음. 주로 후속코드들이 실행되기 전에 특정 조건을 만족하는지 확인하는 용도. 전체 구문을 조기 종료 하기 위한 목적으로 사용

func divide(base: Int) {

    guard base != 0 else {     //-> base 값이 7이므로 조건에 성립하기 떄문에 else문에 들어가지 않는다
        print("연산할 수 없습니다")
        return

    }
    let result2 = 100 / base    //-> guard문의 조건이 성립했기 떄문에 여기서 연산하여 값을 출력한다.
    print(result2)
}

divide(base: 7)

func divide2(base2: Int) {
    guard base2 != 0 else {    // -> base2 값이 130이기 때문에 조건이 성립하여 첫번째 guard문을 빠져나가게 된다.
        print("연산할 수 없습니다.")
        return
    }
    guard base2 > 0 else {     // -> 조건이 성립하기 때문에 guard문을 빠져나가게 됨.
        print("base는 0보다 커야 합니다")
        return
    }
    guard base2 < 100 else { // -> 조건이 성립하지 않기 때문에 else문으로 들어가 print안에 있는 문장이 출력하게 되고 return을 만나 함수가 종료된다.
        print ("base는 100보다 작아야 합니다.")
        return
    }
    let result2 = (100 / base2)
    print(result2)
}
divide2(base2: 130)


// switch - 조건식이 아니라 패턴으로 비교하여 결과 출력, 비교 패턴중 어느 하나라도 반드시 일치해야함.
//그래서 default 구문 추가, 단 default 구문을 대신하여 모든 패턴을 매칭시킬 수있는 구문이 존재하는 경우에 한하여 생략할 수 있다.
let val = 2

switch val {
case 1 :
    print("일치한 값은 1입니다")
case 2 :
    print("일치한 값은 2입니다")
//case 2 : //-> switch 특성 상 위에 case2패턴이 성립하여 코드가 종료되었기 때문에 밑에 case2 패턴이 성립하여도 출력되지 않는다.
//    print("일치한 값 2가 더 있습니다")
default :
    print("어느 패턴과도 일치하지 않습니다")
}

// 비교패턴 간결하게 작성하기
var value = 3

switch value {
case 0, 1:  //-> 이런식으로 간결하게 줄일 수 있다.
    print("0 또는 1입니다")
case 2, 3:
    print("2 또는 3입니다")
default :
    print("default입니다")
}

//튜플타입 패턴

var valuee = (2,3)

switch valuee {
case let (x, 3):
    print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x)입니다.")
    case let (3, y):
    print("튜플의 첫 번째 값이 3일 때 두 번째 값은 \(y)입니다.")
    case let (x, y):
    print("튜플의 두 번째 값이 3일 때 첫 번째 값은 \(x), \(y) 입니다.")
}


//제어 전달문

//break - switch 구문에서의 실행흐름이나 반복 실행 중인 루프를 조건식의 결과에 상관없이 즉각적으로 종료하는데 사용
for row in 0...5 {
    if row > 2 {  // -> for 조건은 5까지 이지만 if문에서 row가 2보다 크면 종료하라고 작성되어 있어 출력은 2까지 나오게 된다.
        break
    }
    print("\(row) was executed")
}

//continue - 컨티뉴 구문 아래에 있는 실행 구문들을 건너뛰고 다음 반복을 시작하는 역할을 한다.

for row2 in 0...5 {
    if row2 < 2 { // -> row2가 2보다 작지 않기 때문데 print 구문 실행후 루프 다시 시작...5까지 실행 후 반복문 종료
        continue
    }
    print("exexuted data is \(row2)")
}

var text = "This is a swift book for Apple's programming language"
var result = ""

for char in text {
    if char == " " {
        result.append(Character("_"))
        continue
    } else if char == "o" {
        result.append(Character("O"))
        continue
    }
    result.append(char)
}
print(result)



