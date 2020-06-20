# TIL
## Today I Learned

## 2020.01.13 - UIView Animation



### UIImage Animation
- UIImageView 에서 여러개의 UIImage에 대한 animation 설정

  ```swift
  let images = UIImageView()
  
  images.animationImages
  // Animation에 사용한 image들 추가. 추가된 Image이 바뀌는 animation
  images.startAnimating()
  // animatonImages에 추가된 UIImage들로 animation
  images.stopAnimating()
  // Animation 종료
  images.animationDuration
  // animationImages에 추가된 UIImage들로 animation을 수행할 때 한 바퀴 돌리는데 걸리는 시간 설정
  images.animationRepeatCount
  // animationImages들을 이용한  animation을 몇 번 반복할지 설정
  
  ```

  

### UIView.animation

- UIView.animatie() 를 사용해서 animation 적용

  ```swift
  UIView.animate(
      withDuration: 1,
      delay: 1,
      usingSpringWithDamping: 0.1,
      initialSpringVelocity: 100,
      options: [.curveEaseIn,.curveLinear,.curveEaseOut,.curveEaseInOut, .beginFromCurrentState, .autoreverse, .repeat],
      animations: {
          //do somthing...
  }) { _ in
      //do somthing...
  }
  
  ```

  - withDuration: animation이 실행되는 전체 시간
  - delay: animation이 실행되는 시간. 0 이상 값을 주면 실행 시간이 늦춰짐
  - animations: animation 적용
  - usingSpringWithDamping: 
    - 기본값 1, 진동없이 정확히 목표치에 도달
    - 1 보다 작을 경우, 목표치에 도달하기까지 진동을 더 많이 함
    - 1보다 클 경우, 목표치에 도달하기 전에 끝남
  - initialSpringVelocity: 기본값 0, 처음에 밀려오는 속도를 조정.
  - option: 자연스러운 animation을 위한 option 
    - curveLinear: 처음부터 끝까지 동일한 속도, motion으로 실행
    - curveEaseIn: 천천히 출발해서 빠르게 도착
    - curveEaseOut: 빠르게 출발해서 천천히 도착
    - curveEaseInOut: 기본값, 천천히 출발해서 빨라지다가 천천히 도착
    - beginFromCurrentState: animation이 취소되거나 계속 반복되거나할 때 현재 상태에서 애니메이션이 실행되도록 함
    - autoreverse: animation이 동작하 방향과 반대로 작동함
    - repeat: animation이 계속적으로 반복
  - completion: animation 실행 후 Bool값 반환

  

- animateKeyframes() 를 사용해서 순차적인 animation 적용

  - UIView.addKeyframe(): 특정 시점에 실행될 animation 지정

  ```swift
  UIView.animateKeyframes(
      withDuration: 2,
      delay: 0,
      animations: {
        // 시작시간: withDuration*delay = 0초
        // 실행시간: withDuration*relativeDuration = 0.5초
          UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 0.25) {
              //do somthing
          }
        // 시작시간: 2*0.25 = 0.5초
        // 실행시간: 2*0.25 = 0.5초
          UIView.addKeyframe(withRelativeStartTime: 0.25, relativeDuration: 0.25) {
              //do somthing
          }
        // 시작시간: 2*0.5 = 1초
        // 실행시간: 2*0.5 = 1초
          UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.5) {
              //do somthing
          }
  })
  ```




### Transition

- UIView.transition() 을 사용해서 전환되는 효과의 animation 적용

  ```swift
  UIView.transition(with: UIView,
                    duration: 0.4,
                    options: [],
                    animations: {
                      // do somthing...
  }) { _ in
      // 비동기, deadline -> 현재시간으로부터 n초 뒤에 
      DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
          // do somthing
      }    
  }
  ```

  - options: transition 효과 적용
    - transitionCrossDissolve: Fade In-Out 효과
    - transitionFlipFromTop: 위로 뒤집는 효과
    - transitionFlipFromLeft: 왼쪽으로 뒤집는 효과
    - transitionFlipFromRight: 오른쪽으로 뒤집는 효과
    - transitionFlipFromBottom: 아래로 뒤집는 효과
    - transitionCurlUp: 위로 말려 올라가는 효과
    - transitionCurlDown: 아래로 말려 내려가는 효과


### UIActivityIndicatorView

- 어떤 작업이 수행중임을 나타낼 수 있는 view, 회전하는 animation 사용 가능
  ```swift
  let activityIndicatorView = UIActivityIndicatorView()
  
  activityIndicatorView.startAnimating()
  // 돌아가는 animation 시작.
  activityIndicatorView.stopAnimating()
  // 돌아가는 animtion 종료.
  activityIndicatorView.hidesWhenStopped
  // animation이 멈췄을 때 화면에서 사라지게 함.
  
  ```




