# TIL
## Today I Learned


### 2020.01.09

- MapKit
``````````````````````````````
[ 과제 ]
1. 입력한 주소들을 차례대로 잇는 선 만들기   (샘플 영상 참고)
> 텍스트필드에 주소를 입력하면 해당 위치로 애니메이션과 함께 맵 이동 (CoordinateSpan 값 - 0.02)
> 입력한 주소값으로 이동한 뒤 그 위치를 표시하기 위한 사각형 그리기 + Annotation 추가하기
> Annotation 의 제목은 1번째 행선지, 2번째 행선지 처럼 순서를 표시하고, 부제목은 그 곳의 주소 나타내기
> 마지막으로 입력한 주소값과 그 직전의 주소값 사이에 선 그리기
  (가장 처음 입력한 주소는 그것과 연결할 직전의 주소값이 없으므로 제외)
참고: delegate 메서드 중 regionDidChangeAnimated 메서드 참고
```````````````````````````````````
<img width="452" alt="스크린샷 2020-01-09 오후 10 11 38" src="https://user-images.githubusercontent.com/57229970/72070835-cd5a1800-332d-11ea-8887-f2467b12bb8d.png">

<img width="452" alt="스크린샷 2020-01-09 오후 10 11 28" src="https://user-images.githubusercontent.com/57229970/72070856-da770700-332d-11ea-9ae5-eb9d3760c300.png">


