# TIL
## Today I Learned

## 2020.03.17 - Sign in with Apple 

### Sign in with Apple 
- 타사 또는 소셜 로그인 서비스(Facebook login, Google login, WeChat login, Kakao longin 등)를 사용하는 앱은 Apple login을 동등한 옵션으로 제공 해야 한다.
- iOS 13.0부터 사용 가능

### Sign in without Apple
- 자체 로그인을 사용하는 앱
- 교육, 기업 또는 비즈니스 앱
- 전자 ID를 사용하여 사용자를 인증하는 앱
- 메일, 소셜 미디어 또는 기타 타사 계정에 직접 로그인 해야 하는 경우

### How to use
- 사진 URL을 제공하지 않음
- 신규 사용자 계정 생성 후, 사용자 인증 정보를 전달 
- 이메일 숨기기를 사용하여 비공개 이메일 주소를 제공할 수 있음
- 앱 또는 웹 개발자만이 이 이메일 주소로 메세지를 보낼 수 있음
- 사용자 이름, 이메일 주소는 최초 로그인 시에만 계정 설정을 위해 제공하기 때문에 별도로 저장해 둬야 한다
- 언제든지 앱에 대한 인증을 철회할 수 있음

### HIG Authentication
- 모든 플랫폼에서 애플 로그인 기능에 대해 고려 -> 애플 플랫폼 + 안드로이드 + 웹 등
- 로그인은 필요한 순간까지 가능한 한 지연 -> 앱 설치 후 로그인 화면부터 나오지 않도록 할 것
- 가입하는 방법과 인증 시 이점을 설명해줄 것
- Passcode 라는 용어를 사용하지 말 것 (iOS 기기 언락과 Apple Pay 인증에 사용)

### HIG - Apple ID Button
- 잘 보이도록 위치 시켜야 함 -> 다른 버튼보다 작게하지 말고, 스크롤 하지 않고 보이게 할 것
- 시스템에서 제공해주는 버튼을 사용했을 때의 이점
> 애플에서 공인된 스타일을 사용하는 것이 보장
> 버튼 스타일을 변경할 때 그 내용이 이상적인 비용을 유지할 것을 보장
> 버튼의 제목을 기기에서 지정한 언어로 자동 변환
> 보이스오버 지원

- 다음 가이드를 따를 것

<img width="599" alt="스크린샷 2020-05-12 오후 7 00 57" src="https://user-images.githubusercontent.com/57229970/81670783-127c8b00-9483-11ea-8efc-a9316050e054.png">

### ASAuthorizationAppleIDButton Type

<img width="755" alt="스크린샷 2020-05-12 오후 7 07 06" src="https://user-images.githubusercontent.com/57229970/81671273-ca119d00-9483-11ea-9830-40b2a1aef80f.png">

### ASAuthorizationAppleIDButton Style

<img width="622" alt="스크린샷 2020-05-12 오후 7 07 57" src="https://user-images.githubusercontent.com/57229970/81671392-e9a8c580-9483-11ea-9c17-c909f909c8cf.png">

### Custom Button
- 커스텀 버튼은 반드시 리소스를 다운 받아서 활용할 것
> [링크: ]( https://developer.apple.com/design/resources/)
> 포맷: PNG, SVG, PDF
> 왼쪽 정렬 로고 파일, 로고 온리 로고 파일

- Guide Line
> 애플 로고 자체를 버튼으로 사용하지 말 것
> 로고 파일의 높이를 버튼의 높이와 맞출 것
> 로고 파일을 자르지 말 것
> 세로축 여백을 추가하지 말 것
> 컷텀 컬러 사용하지 말 것







