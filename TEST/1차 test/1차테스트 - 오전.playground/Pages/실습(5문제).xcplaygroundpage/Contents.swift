import Foundation

/*
 다음의 클로져를 FullSyntax 로부터 Optimized Syntax 로 차근차근 줄여보세요.
 그리고 그 과정에 일어나는 변화를 주석으로 설명하세요.
 
 func performClosure(param: (String) -> Int) {
   param("Swift")
 }
 ***************************************************/


func performClosure(param: (String) -> Int) {
  param("Swift")
}
performClosure(param: {(str: String) -> Int in
    return str.count
})

performClosure (param: {(str: String)  in
    return str.count
})

performClosure(param: { str in
    return str.count
})

performClosure(param: {
    return $0.count
})

performClosure(param: {
    $0.count
})

performClosure(){ $0.count }

performClosure { $0.count }









////클로저 시작~~~
//performClosure(param: { (str: String) -> Int in
//  return str.count
//})
//
//// Int로 리턴받을 걸 아니까 생략
//performClosure(param: { (str: String) in
//  return str.count
//})
//
//// 클로저로 넘어오는 걸 string인 것을 알기 때문에 str이라고 명시만 하면됨
//performClosure(param: { str in
//  return str.count
//})
//
//// 넘어오는게 하나여서 $0으로 사용가능
//performClosure(param: {
//  return $0.count
//})
//
//// 한줄일땐 리턴 생략가능
//performClosure(param: {
//  $0.count
//})
//
//// 받는게 하나밖에 없기때문에 생략가능
//performClosure() {
//  $0.count
//}
//// 받는게 하나여서 소괄호 생략가능
//performClosure { $0.count }


/*
 자연수 하나를 입력받아 1년부터 그 해까지의 모든 윤년의 개수를 출력하는 함수
 (공식 : 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
 윤년X 예시 - 200, 300, 500, 600, 1900, 2100
 
 Intput : 2019
 Output : 윤년에 속하는 해는 총 489회입니다.
 ***************************************************/

func leafYear(a: Int) {
    var temp = [Int]()
    
    for i in 1...a {
        if i % 4 == 0 && (i % 100 != 0 || i % 400 == 0){
            temp.append(i)
        }
    }
    print(temp.count)
    print(temp)
}

leafYear(a: 2019)

func year(b: Int) {
    var count = 0
    for i in 1...b {
        if i % 4 == 0 && (i % 100 != 0 || i % 400 == 0 ) {
            count += 1
            
        }
    }
    print(count)
}
year(b: 2019)
    



/*
 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
 e.g.
 > Input : ["a", "b", "c", "a", "e", "d", "c"]
 > Output : ["b", "e" ,"d"]
 ***************************************************/
//
//// 배열에서 중복x 문자 뽑아 배열로 반환
//func uniqueWord(strArr:[String])->[String] {
//    // 배열 비교를 빈 배열 두개 만듦
//    var arr1 = [String]()
//    var arr2 = [String]()
//
//
//    // 주어진 문자배열에서 문자 한개씩 뽑아냄
//    for str in strArr {
//        //  뽑아낸 그 문자가 arr1과 arr2에 없다면
//        if !arr1.contains(str) && !arr2.contains(str){
//            // arr1에 추가해주세요
//            arr1.append(str)
//        // arr1이나 arr2에 있다면 arr1의 첫번째 str을 index에 넣어줌
//        } else if let index = arr1.firstIndex(of: str) {
//            // arr1 배열에서는 그 str을 삭제
//            arr1.remove(at: index)
//           // arr2 배열에는 추가
//            arr2.append(str)
//        }
//    }
//    return arr1
//}
//uniqueWord(strArr: ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"])
//
//func uniqueValue(stringArr: [String]) -> [String] {
//    var array1 = [String]()
//    var array2 = [String]()
//
//    for a in stringArr {
//        if !array1.contains(a) && !array2.contains(a) {
//            array1.append(a)
//        } else if let index = array1.firstIndex(of: a) {
//            array1.remove(at: index)
//            array2.append(a)
//        }
//    }
//    return array1
//}
//
//uniqueValue(stringArr: ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"])





func 중복X값(받는배열:[String]) -> [String] {
    var 비교배열1 = [String]()
    var 비교배열2 = [String]()
    
    for 값 in 받는배열 {
        if !비교배열1.contains(값) && !비교배열2.contains(값) {
            비교배열1.append(값)
        } else if let 인덱스 = 비교배열1.firstIndex(of: 값) {
            비교배열1.remove(at: 인덱스)
            비교배열2.append(값)
        }
    }
    return 비교배열1
}
중복X값(받는배열: ["a", "b", "c", "a", "e", "d", "c", "a", "c", "f"])



/*
 자연수를 입력받아 그 숫자보다 작거나 같은 모든 소수와 그 개수를 출력하는 함수를 정의
 
 e.g.
 func checkPrimeNumbers(number: Int)
 > Input : 10
 > Output : 10보다 작거나 같은 소수는 [2, 3, 5, 7]이고, 총 4개입니다.
 ***************************************************/

//func checkPrimeNumbers(number: Int) {
//    var count = [Int]()
//
//    for i in 2...(number - 1) {
//        if i < number {
//            if number % i == 0 {
//            count.append(i)
//
//            }
//
//        }
//
//    }
//    print("10보다 작거나 같은 소수는 \(count)이고, 총\(count.count)개여")
//}
//
//
//
////checkPrimeNumbers(number: 1)
//checkPrimeNumbers(number: 10)
//checkPrimeNumbers(number: 100)
//

//func isPrime(number: Int) -> Bool {
//    for i in 2..<number {
//        if number % i == 0 {
//            return false
//        }
//    }
//    return true
//}
//func checkPrimeNumbers(number: Int) {
//
//    var primeArr = [Int]()
//
//    for i in 2..<number {
//        if isPrime(number: i) {
//            primeArr.append(i)
//        }
//    }
//    print(primeArr)
//}
//checkPrimeNumbers(number: 20)


func isPrime(number: Int) -> Bool {
    
    for i in 2..<number {
        if number % i == 0 {
            return false
        }
    }
    return true
}
isPrime(number: 10)

func checkPrimeNumbers(number: Int) {
    var primeArr = [Int]()
    
    for i in 2..<number {
        if isPrime(number: i) {
            primeArr.append(i)
        }
    }
        print("\(number)보다 작거나 같은 소수는 \(primeArr)이고, 총 \(primeArr.count)개입니다")
    
}
checkPrimeNumbers(number: 20)



/*
 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
 각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
 그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.
 
 e.g.
 enum Site {}
 > Input
 let google = Site.google("google@gmail.com", "0000")
 google.signIn()
 
 > Output
 구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)
 ***************************************************/

enum Site {
    case naver(String, String)
    case google(String, String)
    case kakao(String, String)

    func signIn() {
        switch self {
        case .naver(let id, let pw):
            print("네이버에 로그인하였습니다.(아이디 - \(id), 비밀번호 \(pw))")
        case .google(let id, let pw):
            print("구글에 로그인하였습니다.(아이디 - \(id), 비밀번호 \(pw))")
        case .kakao(let id, let pw):
            print("카카오에 로그인하였습니다.(아이디 - \(id), 비밀번호 \(pw))")
    
        }
    }
}

let yukyung = Site.kakao("yukyung", "1234")
yukyung.signIn()



//enum Site {
//    case google(String, String)
//    case kakao(String, String)
//    case naver(String, String)
//
//    func signIn() {
//        switch self {
//        case .google(let id, let pw):
//            print("아이디 - \(id), 비밀번호 - \(pw)")
//
//        case .kakao(let id, let pw):
//            print("아이디 - \(id), 비밀번호 - \(pw)")
//
//        case .naver(let id, let pw):
//            print("아이디 - \(id), 비밀번호 - \(pw)")
//        }
//    }
//}
//
//let google = Site.google("ups@gmail.com", "1234")
//google.signIn()
//





/***************************************************
 수고하셨습니다!
 ***************************************************/

