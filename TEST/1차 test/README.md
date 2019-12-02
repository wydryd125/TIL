# TIL
## Today I Learned


### 2019.12.02

`````````````````````
1. "Hello, World!" 문자열을 출력하기 위한 코드 작성
2. 2개의 정수를 입력 받아서 그 숫자들을 더한 뒤 결과를 정수로 반환하는 함수 작성
3. 2개의 정수를 입력 받아 그 숫자들을 곱한 뒤 결과값을 문자열로 반환하는 함수 작성
4. 주어진 숫자가 짝수인지 여부를 판단하는 함수 작성 (switch 문으로 해결)
5. Swift 3가지 다른 반복문 방식별로 각각 1부터 10까지 값을 더한 결과를 출력하는 코드 작성
6. Swift 에서 사용하는 네이밍 컨벤션의 종류를 나열하고 그것이 언제 사용되는지, 그리고 그 특징에 대해 설명


1. Array, Set, Dictionary 의 차이점에 대해 설명하고 예시 코드 작성
2. Value Type, Reference Type 에 대한 예시와 그 차이점에 대해 설명
3. Application의 LifeCycle의 각 상태에 대해 설명
4. ViewController LifeCycle의 각 상태에 대해 설명
5. 다음 4개의 키워드 (continue, break, return, fallthrough)가 쓰이는 위치와 역할에 대해 각각 설명
6. Init 메서드가 필요한 경우와 그렇지 않은 경우의 차이점에 대해 설명
7. Access Level 을 각 단계별로 나열하고 그 차이점에 대해 설명
8. OOP 4대 특성에 대해 나열하고 각 특성에 대해 아는 만큼 설명 및 예시 코드 작성
9. Frame 과 Bounds 의 차이점에 대해 설명


1. 다음의 클로져를 FullSyntax 로부터 Optimized Syntax 로 차근차근 줄여보세요.
그리고 그 과정에 일어나는 변화를 주석으로 설명하세요.

func performClosure(param: (String) -> Int) {
  param("Swift")
}

2. 자연수 하나를 입력받아 1년부터 그 해까지의 모든 윤년의 개수를 출력하는 함수
(공식 : 매 4년 마다 윤년. 매 100년 째에는 윤년이 아님. 매 400년 째에는 윤년)
윤년O 예시 - 160, 204, 400, 1996, 2000, 2800
윤년X 예시 - 200, 300, 500, 600, 1900, 2100

Intput : 2019
Output : 윤년에 속하는 해는 총 489회입니다.

3. 주어진 문자 배열에서 중복되지 않는 문자만을 뽑아내 배열로 반환해주는 함수
e.g.
> Input : ["a", "b", "c", "a", "e", "d", "c"]
> Output : ["b", "e" ,"d"]

4. 자연수를 입력받아 그 숫자보다 작거나 같은 모든 소수와 그 개수를 출력하는 함수를 정의

e.g.
func checkPrimeNumbers(number: Int)
> Input : 10
> Output : 10보다 작거나 같은 소수는 [2, 3, 5, 7]이고, 총 4개입니다.

5. 구글(google), 카카오(kakao), 네이버(naver) 로그인을 위해 Site라는 이름의 Enum 타입을 만들고자 합니다.
각 case는 사용자의 아이디(String)와 비밀번호(String)를 위한 연관 값(associated value)을  가집니다.
그리고 Site 타입 내부에는 signIn()이라는 이름의 메서드를 만들어 다음과 같이 문자열을 출력하는 기능을 구현해보세요.

e.g.
enum Site {}
> Input
let google = Site.google("google@gmail.com", "0000")
google.signIn()

> Output
구글에 로그인하였습니다. (아이디 - google@gmail.com, 비밀번호 - 0000)

``````````````````````````````````````````


