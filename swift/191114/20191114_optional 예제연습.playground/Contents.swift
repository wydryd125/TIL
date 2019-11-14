import UIKit

/* 옵셔널 타입 선언과 정의
 자료형 뒤에 '?'만 붙이면 됨 */

//옵셔널 type

var optInt: Int?
var optStr: String?
var optDoule: Double?
var optArr: [String]?
var optic: Dictionary<String, String>?
var optic2: [String : String]?
var optclass: AnyObject?

/*옵셔널 강제 해제
 옵셔널 값뒤에 '!'만 붙여주면 됨*/

var optionalInt: Int? = 3

print("옵셔널 자체의 값 : \(optionalInt)")
print ("!로 강제 해제한 값 : \(optionalInt!)")

Int("123")! + Int("123")!
Int("123")! + 30  //-> 옵셔널 해제하여 연산 했기 때문에 값 추출 가능

var str = "123"
var intFromStr = Int(str)

if intFromStr != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromStr!)입니다")
    
} else {
    print("값 변환에 실패하였습니다")
}


// 강제 해제 연산자를 사용 할 때에는 옵셔널 값이 nil인지 점검 해야함

var string1 = "Swift"
var intFromString = Int(string1)

if intFromString != nil {
    print("값이 변환되었습니다. 변환된 값은 \(intFromString)")
} else {
    print ("값 변환에 실패했습니다")
}

// -> 문자열이 숫자로 변환할 수 없는 값이여서 else문 출력됨


