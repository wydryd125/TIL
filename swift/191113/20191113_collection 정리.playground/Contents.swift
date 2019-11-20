import UIKit

//array

var cities = ["seoul","newyork","LA","santiage"]
let length = cities.count
//count의 속성을 이용하여 배열의 크기를 얻었다면 이를 상수 length를 할당
for i in 0..<length {
    print("\(i)번째 배열 원소는 \(cities[i])")
}

var cities2 : Array<String> = Array() //-> 선언 및 초기화
var cities3 = [String]() // -> 다른 방식의 선언 및 초기화

var list = [String]()
list = ["가","나","다","라"]

if list.isEmpty { //-> isEmpty 배열에 아이템이 있는지 확인 하는 속성
    print("배열이 비어 있는 상태입니다")
    
} else {
    print("배열에는 \(list.count)개의 아이템이 저장되어 있습니다")
}

//배열 아이템의 동적 추가
//apend() -> 입력된 값을 배열의 맨 뒤에 추가
//insert( at) -> 원하는 위치에 직접 추가
//append(contentsOf:) -> 여러개의 값을 배열에 한번에 추가

var cities4 = [String]()

cities4.append("seoul")
cities4.append("newyork")
cities4.insert("Tokyo", at: 1)
cities4.append(contentsOf: ["Dubai","sydney"])
print(cities4)

//배열을 추가하지 않고 값을 바꾸고 싶다면 아래처럼... 대신 그 자리 값이 삭제됨 이 방법은 값만 바꿀수 있고 배열을 추가하지 못한다.

cities4[1] = "Madrid"
print(cities4)

var alphabet = ["a","b","c","d","e"]

alphabet[0...2]
alphabet[2...3]
alphabet[1..<3]
alphabet[1...2] = ["1","2","3"]
print(alphabet)
alphabet[2...4] = ["A"]
print(alphabet)

//set
var genre = Set<String>() //-> 선언 및 초기화


var genres : Set = ["classic","Rock","balad"]
//-> 선언시 set를 붙여주지 않으면 배열로 선언 됨
if genres.isEmpty {
    print("집합이 비어있습니다")
        
    } else {
    print("집합에는 현재 \(genres.count) 개의 값이 있습니다")
}

var genres2 : Set = ["Dance","balad","classic"]
    for g in genres2.sorted() {
        print("\(g)")
    }
// ->set는 순서가 없기 떄문에 단순히 메소드의 반환값을 정렬


var genres3 : Set = ["Dance","balad","classic"]

genres3.insert("jazz") //-> 집합에 jazz를 추가
print(genres3)
print(genres3.contains("Rock"))//-> 집합에 해당 값이 있는지 확인
genres3.remove("classic") // -> 집합의 classic을 제거
print(genres3)
genres3.removeAll() // -> 집합의 값을 모두 제거
print(genres3)


//튜플 - 선언하고 나면 상수적 성격을 띠므로 더 이상 아이템 추가XXXXXX
let tupleValue:(String, Character, Int, Float, Bool) = ("a","b", 1, 1.25, true)

let(a,b,c,d,e) = tupleValue
//-> 가독성이 떨어지기 때문에 튜플의 아이템을 각각 변수나 상수로 할당

print(a,b)
print(c,d)
print(e)

//튜플은 for~in XX, 하지만 함수나 메소드에서는 유용하게 사용할 수 있음.
func getTupleValue() -> (String, String, Int) {
    return("안녕","나는", 602)
}
let (f,g,h) = getTupleValue()

// 사용하지 않을 튜플 아이템은 언더바(_)로 대체 할수있음, 언더바를 포함한 전체 변수나 상수의 개수는 튜플의 아이템과 일치해야함

func getTupleValue1() -> (String, String, Int) {
    return("안녕","나는", 602)
}
let (i,j,_) = getTupleValue1()

//함수는 하나의 객체만 반환할 수 있어서 튜플을 사용하면 아주 유용하다~~~~


//딕셔너리 - [키 : 값, 키 : 값]
var capitall = [String:String]() // -> 딕셔너리 선언 및 초기화

var capital = ["KR":"Seoul", "EN":"London", "FR":"Paris"]
capital["JP"] = "Tokyo" // -> 기존 딕셔너리에 키:값 추가 && 변경
capital["KR"] = "Busan" // -> 기존 키에 값을 변경
capital

if capital.isEmpty {
    print("값이 비었슈")
    
} else {
    print ("딕셔너리의 크기는 현재 \(capital.count)입니다")
}

for (key, value) in capital {
    print("현재 데이터는 \(key) : \(value)입니다")
}




