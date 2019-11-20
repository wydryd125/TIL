

/* 두 개의 자연수를 입력받아 두 수를 하나의 숫자로 이어서 합친 결과를 정수로 반환하는 함수
  (1과 5 입력 시 15,  29와 30 입력 시 2930,  6과 100 입력 시 6100) */

func number (a : Int, b : Int){
    print("\(a)"+"\(b)")
    
}
number(a: 49, b: 14)




// 문자열 두 개를 입력받아 두 문자열이 같은지 여부를 판단해주는 함수
func sameWord (a : String, b : String){
    if a == b{
        return print("같습니다")
    }
    else{
        return print("다릅니다")
    }
}
sameWord(a: "아라비아따", b: "아라비오따")




//자연수를 입력받아 그 수의 약수를 모두 출력하는 함수

var divisorNum : Int = 2839
    for i in 1...divisorNum{
        if divisorNum % i == 0{
            print(i)
        }
    }
    


// 100 이하의 자연수 중 3과 5의 공배수를 모두 출력하는 함수

for i in 1...100{
    if(i % 3 == 0) && (i % 5 == 0){
    print(i)
}
}




//[ 도전 과제 ]

// 2 이상의 자연수를 입력받아, 소수인지 아닌지를 판별하는 함수

//var primeNum: Int = 35
//for i in 2...(primeNum - 1) {
//    if (primeNum % i == 0 ) {
//        print("소수가 아닙니다")
//        break
//    } else {
//        print("소수입니다")
//    }
//}

func ex2(a: Int) {
    var count = 0
    
    for i in 2...a {
        if (a % i == 0) {
            count += 1
            
        }
    }
    
    if count > 1 {
        print("소수가 아닙니다")
    } else {
        print("소수입니다")
    }
}

ex2(a: 3)
//------------------------------------------------------------

func primeNum(a: Int) -> String {
    var count = 0
    
    for i in 2...a {
        if(a % i == 0) {
            count += 1
        }
    }
    if count > 1 {
            return "소수 입니당"
        } else {
            return "소수가 아닙니당"
    }
}
print(primeNum(a: 3))

        
        
//------------------------------------------------------------

var num = 12


func minority ( num: Int) -> Bool{
    for i in 2...num-1{

        if num%i == 0{
            return false
        }
    }
return true
}


print("입력값 :\(num) 결과: \(minority(num: num))")



/* 자연수 하나를 입력받아 피보나치 수열 중에서 입력받은 수에 해당하는 자리의 숫자를 반환하는 함수
  참고로 피보나치 수열은 이전 두 수의 합이 다음 수가 되는 수열
  e.g.  0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89 ....
  함수 호출 시 입력받은 숫자가 4인 경우 피보나치 수열의 4번째 위치인 2 출력 */

var pibo = [0,1,1,2,3,5,8,13,21,34,55,89]

func inputNum(a: Int) -> Int {
    if 



}





/* 정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수
  (공식 - 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
  ex) 윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
      윤년X 예시 - 200, 300, 500, 600, 1900, 2100 */


//func leapYears(a: Int) {
//    if a % 4 == 0 {
//        print ("\(a)년도는 윤년 입니다요")
//    } else if a % 100 == 0 {
//        print ("\(a)년도는 윤년이 아니다요")
//    } else if a % 400 == 0 {
//        print ("\(a)년도는 윤년입니다요")
//    } else {
//        print ("\(a)년도는 윤년이 아니다요")
//    }
//}
//leapYears(a: 100)

//
//func leapYears(a: Int) {
//    if (a % 4 == 0) || (a % 400 == 0) {
//        print ("\(a)년도는 윤년 입니다요")
//    } else if a % 100 == 0 {
//        print ("\(a)년도는 윤년이 아니다용")
//    } else {
//        print ("\(a)년도는 윤년이 아니다요")
//    }
//}
//leapYears(a: 100)
//
//

func leapYears(a: Int) {
    if ((a % 4 == 0) && (a % 100 != 0) ) || (a % 400 == 0) {
        print("\(a)년도는 윤년입니다")
    } else {
        print("\(a)년도 윤년이아니다")
    }
}
leapYears(a: 1200)
//----------------------------------------------------------


print("정수를 입력받아 윤년(2월 29일이 있는 해)인지 아닌지 판단하는 함수")

func getLeapYear (num : Int) -> Bool{
    if num%4 == 0 {
        if num%400 == 0{
            print("\(num)년은 윤년입니다")
            return true
        }else if num%100 == 0 {
            print("\(num)년은 윤년이 아닙니다")
            return false
        }else{
            print("\(num)년은 윤년입니다")
            return true
        }
    }else{
        print("\(num)년은 윤년이 아닙니다")
        return false
    }
}
getLeapYear(num: 1893)


//---------------------------------------------------
