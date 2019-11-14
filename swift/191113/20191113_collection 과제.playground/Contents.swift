import UIKit

var str = "Hello, playground"


//[ 과제 ]
/* 자연수를 입력받아 원래 숫자를 반대 순서로 뒤집은 숫자를 반환하는 함수
  ex) 123 -> 321 , 10293 -> 39201 */

func reverseNum(a: Int) -> Int {
    
    let str = String(a)
    var temp = String()

    for i in str.reversed() {
        temp.append(i)
    }
    
    return Int(temp)!
}

print(reverseNum(a: 1234))






/*- 100 ~ 900 사이의 숫자 중 하나를 입력받아 각 자리의 숫자가 모두 다른지 여부를 반환하는 함수
  ex) true - 123, 310, 369   /  false - 100, 222, 770 */


//func inputNum(aa: Int) -> Bool {
//
//    let str = String(aa)
//    var temp = String(){
//
//        for i in str {
//            if i ==
//
//        }
//    }
//}
//inputNum(aa: 123,456,789)
//
//

/* [ 도전 과제 ]
- 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
  ex) ["a", "b", "c", "a", "e", "d", "c"]  ->  ["b", "e" ,"d"]
- 별도로 전달한 식육목 모식도 라는 자료를 보고 Dictionary 자료형에 맞도록 중첩형태로 데이터를 저장하고
  + 해당 변수에서 표범 하위 분류를 찾아 사자와 호랑이를 출력하기 */
