import UIKit

/*프로퍼티(구조체와 클래스 내부에 정의된 변수, 상수)와
메소드(구조체와 클래스 내부에 정의된 함수)가 정의된 구조체(struck)와 클래스(class)*/

struct Resolution {
    var width = 0
    var height = 0
    
    func desc() -> String {
        return "Resolution 구조체"
    }
}

class VideoMode {
    var interlaced = false
    var frameRate = 0.0
    var name : String?
    
    var res = Resolution()// -> res -> VideoMode클래스의 프로퍼티이자 동시에 Resolution 구조체의 인스턴스
    
    func desc() -> String {
        return "videomode 클래스"
        
    }
}
    let vMode = VideoMode() // -> video 클래스에 대한 인스턴스 생성 하고 상수에 할당함.
    
    print("vMode 인스턴스의 width 값은 \(vMode.res.width)입니다")
// - width에 접근하려면 하위 프로퍼티부터 단계적으로 점을 찍어가며 접근 vMode -> resolution -> width

vMode.name = "Sample"
vMode.res.width = 1280

print("\(vMode.name!) 인스턴스의 width 값은 \(vMode.res.width) 입니다")

let defaultRes = Resolution(width: 1024, height: 768)
//-> width와 height를 매개변수로 하여 Resolution 인스턴스를 생성, 멤버와이즈 초기화 구문을 이용하여 초기화.


/* 구조체의 초기화 구문은 두 개
 1. Resolution() --> 기본 초기화 구문, 내부적으로 프로퍼티를 초기화 하지 않음
 2. Resolution(width: Int, height: Int) -> 모든 프로퍼티의 초기값을 입력받는 멤버와이즈 초기화 구문. 내부적으로 모든 프로퍼티를 초기화함.
 
  클래스의 초기화 구문
 1.인스턴스 뒤 빈 괄호 형태로만 가능. 멤버와이즈 초기화는 안된다.
.*/

//값전달 - 복사에 의한 전달(구조체)
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd

cinema.width = 2048 // -> 상수 hd의 값을 바꾸려고 하면 오류발생 변수여서 가능
print("cinema 인스턴스의 width 값은 \(cinema.width)입니다")
print("hd 인스턴스의 width 값은 \(hd.width)입니다")

//값전달 - 참조에 의한 전달(클래스) -> 한 곳에서 수정할 경우 다른 곳에도 적용
let video = VideoMode()
video.name = "Original Video Instance"

print("video 인스턴스의 name값은 \(video.name!)입니다.")

let dvd = video
dvd.name = "DVD Video Instance"

print("video 인스턴스의 name 값은 \(video.name!)입니다.")
//-> video 상수의 프로퍼티에서도 값이 변경

func changeName(v: VideoMode) {
    v.name = "Funtion Video Instance"
}
changeName(v: video)
print("video 인스턴스의 name값은 \(video.name!)입니다.")

/* 클래스 인스턴스는 여러 곳에서 동시에 참조가 가능하므로 한 곳에서의 참조가 완료 되었다고 해도 메모리에서 해제할 수 없다.
 다른 곳에서 해당 인스턴스를 계속 참조하고 있을 가능성이 있으므로
 
 오류를 방지하기 위해
 ARC - 지금 클래스 인스턴스를 참조하는 곳이 모두 몇 군데인지 자동으로 카운트 해주는 객체
       변수나 상수, 함수의 인자값을 할당되면 카운트를 1증가, 해당 변수나 상수들이 종료되면 카운트 1감소
       참조 카운트가 0이 되면 메모리 해제*/

if (video === dvd) {
    print("video와 dvd는 동일한 VideoMode 인스턴스를 참조하고 있군요.")
} else {
    print("video와 dvd는 서로 다른 VideoMode 인스턴스를 참조하고 있군요.")
}



 


    

