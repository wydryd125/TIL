# TIL
## Today I Learned


### 2019.12.13
- Calculator 

````````````````````````````````````````````
[ 계산기 구현 내용 ]
- displayLabel 에는 2 + 3 / 4 와 같이 여러 개의 표현식이 출력되지 않고 결과창에는 항상 숫자만 표현
- 곱하기(×)와 나누기(÷) 기호는 control + command + spacebar를 눌러서 수학 기호를 사용해야 함
- 2 + 3 * 4를 하면 2 + (3 * 4) = 14가 되는 게 아니라 (2 + 3) * 4 와 같이 항상 누른 순서대로 연산
- 2 + =  순으로 누르면 현재 displayLabel에 표현된 숫자인 2가 더해져 2 + 2 = 4 와 같이 동작
  단, 다시 한 번 = 를 누르면 더 이상 계산되지 않음
- 2 + + + x - 3 = 순으로 누르면 최종적으로 - 연산자가 적용되어 2 - 3 = -1
- 등호(=)를 눌러 계산 결과가 나온 뒤 연산자를 누르지 않고 바로 숫자를 입력하면 
  기존의 값은 초기화되고 다시 처음부터 시작

- 테스트 케이스 예시
  > 12 = 3          => 결과: 3  -  12는 초기화 되고 최초에 3을 누른 것부터 다시 시작
  > 12 + 3 = + 4 =  => 결과: 19 -  12 + 3 + 4 = 19
  > 12 + 3 + + - +  => 결과: 15 -  이후에 계산할 연산자만 바뀌고 숫자는 고정
  > 12 + - x / 3 =  => 결과: 4  -  마지막으로 누른 연산자(/)로 연산. 12 / 3 = 4
  > 12 + =          => 결과: 24 -  12 + 12 = 24
  > 12 + = = =      => 결과: 24 -  12 + 12 = 24,  등호(=)는 이전 연산자에 대해 한 번만 계산
  > 12 +-*/ +-*/    => 결과: 12  - 연산자를 막 바꿔가면서 눌렀을 때 이상 없는지 체크
  > 1 * 2 + 3 / 2 - 1 => 결과: 1.5
  > 숫자를 큰 수나 작은 수 음수로 바꿔가며 결과가 제대로 나오는지 테스트해보기

`````````````````````````````````````````````
<img width="452" alt="스크린샷 2019-12-20 오후 7 58 38" src="https://user-images.githubusercontent.com/57229970/71250784-e93c5080-2363-11ea-98d9-448b3dde1ee6.png">


<img width="452" alt="스크린샷 2019-12-20 오후 7 58 24" src="https://user-images.githubusercontent.com/57229970/71250800-f48f7c00-2363-11ea-8ed6-8f417ca3d1be.png">


<img width="452" alt="스크린샷 2019-12-20 오후 7 58 35" src="https://user-images.githubusercontent.com/57229970/71250816-02450180-2364-11ea-9be5-01561cc72047.png">






