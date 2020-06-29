# TIL
## Today I Learned

## 2019.11.08 - Swift-Basic

### playground
- shift + Enter: 커서까지 실행
- shift + Command + Enter: 전체실행
- Automatically / Manually Run

### Swift
- print : debug 영역에 출력
- `print(a, b, c, d, ...)` : 한줄에 여러개 pring
- `\(some variable)` : 문자열 보간
- `//` : 한 줄 주석, Coommand + /
- `///` : 한 줄 주석 + Quick Help Markup, Command + Option + /
- `/* */` : 멀티 라인 주석

### 변수/상수

- 이름의 의미, 방식에 따라 앞으로 바뀔 수 잇는 것은 `var`,  바뀌면 안되는 것은 ` let`
- 변수명/ 상수명으로 사용 불가능 
  - 숫자가 앞에 올 때
  - 사이에 공백 안됨
  -  특정 기호 안됨
  - 위에서 선언한 이름으로 재 선언 안됨

### Type

	- 타입을 지정하면 `let`, `var`의 선언과 할당을 별도로 할 수 있음
	- 타입 지정하지 않아도 타입을 추론
	- 타입을 직접 명시하면 타입을 추론할 필요 없으므로 컴파일 속도 증가
	- `type(of:)` : 변수의 타입 반환

### Type Conversion

- `Int()`, `Float()`,`Double()` 등

- Literal type은 어딘가 할당되기 전에는 Literal type으로 존재하기 때문에 다른 타입 (`Int8`)과 연산할 수 없음

- Literal 값을 변수에 할당할 때 type이 변경됨

  ```swift
  let a = Int8(10)
  let b = 10
  
  let c = a * b //-> Error: Type이 맞지않음
  let d = a * 10 //-> 연산가능: Int8 type으로 inference되어 연산가능
  ```



### Operator

### 구분 

1. 단항 연산자(Unary Operator)

   - Prefix(전위 표기법) : 앞에 붙이는 연산자 (`-a`, `!a`)
   - Postfix(후위 표기법) : 뒤에 붙이는 연산자 (`a!`)

2. 이항 연산자(Binary Operator)

   - Infix(중위 연산자) : 양 쪽에 두 값이 필요한 연산자

3. 삼함 연산자(Ternary Operator)

   - 세 항으로 표현하는 연산자
   - 앞 연산자를 통한 결과가 true or false인지에 따라 다른 결과를 반환
   - `a > 0 ? "positive" : "negative"`

### 종류

 1. 할당 연산자(Assignment Operator)

    - `=` 을 사용해 할당

    - `+=`,`-=`, `*=`,`/=`,`%=`등 합쳐서 사용 가능

2. 산술 연산자(Arithmetic Operator)

    - plus, minus : `+a`, `-a`

    - sum, subtract, multiply : `a + b`,`a - b`,`a * b`

    - division, modulo : `a / b`,`a & b`

    - 실수에서 나머지 연산

      - `remainder(dividingBy:)` : 반올림한 나머지를 반환
      - `truncatingRemainder(divideingBy:)` : 내림한 나머지를 반환

      ```swift
      let e = 123.4
      let f = 5.678
      let quotient = (e / f).rounded(.towardZero)
      let remainder = e.truncatingRemainder(diideinBy: f)
      let sum = f * quotient + remainder
      ```
      

3. 비교연산자(Comparison Operator)

   - equal / not equal : `==`, `!=`
   - greater / greator and equal : `>`,`<`,`>=`, `<=`
   - 문자열에 대한 비교도 가능. ASCII code 값의 크기를 비교
     - `iOS > Apple` : true.
     - `Apple > Steve Jobs` : flase
     - `swift5 <= swift4` : false
   
   
   
4. 논리 연산자 (Logical Operator)

  - AND(`&&`) 
  - OR(`||`)
  - NOT(`!`)
  - 논리 연산자 결합 사용 : 우선순위가 AND > OR

    - `true && false || true` : `false || true`이므로 `true`

    - `true && false || false` : `false || false`이므로 `false`
    

  

 5. 범위 연산자(Range Operator)

    - `a...b` : a부터 b까지 범위 (Closed Range Operator), a는 반드시 b보다 작아야함.
    - `a..<b` : a부터 b까지 . b는 포함하지 않음 (Half=Open Range Operator)
    - `a...` : a부터 끝까지(One-side Operator)
    - `...a`: 처음부터 a까지
    - `lowerBound` : range에서 가장 낮은 값
    - `upperBound` : range에서 가장 큰 값
    - `reversed()` : range의 역순을 반환
    - `stride(from:to:by:)` : `from`부터 `to` 이전까지 `by` 간격으로 반복 (`to`포함하지 않음)
    - `stride(frome:through:by:)` : `from`부터 `throught`까지 `by` 간격으로 반복 (`to`포함하지 않음)






