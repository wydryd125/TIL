# TIL
## Today I Learned


- Domino's (by. up's)

````````````````````````````````````````````
<ListViewController>
- TableView
- Section Height : 80
- Cell Height : 120
- 각 카테고리별 음식 가격
(종류별로 동일, 이미지의 가격은 무시)
*피자 (슈퍼시드, 프리미엄, 클래식) : 10000원 *사이드디시 : 7000원
*음료 : 3000원 *피클&소스 : 500원

<DetailViewController>
- Navigation
Title: 선택한 상품 
- ImageView
ListController 에서 선택한 메뉴의 이미지 표현
- Button / Label
주문 수량을 나타내는 레이블과 수량을 조절하기 위한 +/- 버튼 구현
주문 수량을 1이상으로 설정했을 경우 WishListViewController에 주문 내역을 확인 할 수 있도록 구현

<WishListViewController>
- Navigation
 BarButtonItem 2개 생성
‘목록 지우기’ - 장바구니 내역 초기화 ‘주문’ - 장바구니 아이템 주문 화면 띄우기
- TableView
Cell Height: 100
* 아이템이 있고, 주문 버튼 클릭 시 *
- AlertController 에서 다음과 같이 주문한 아 이템의 수량과 결제 금액을 표기
- AlertAction 구현 (돌아가기, 결제하기) ‘돌아가기’ - 주문 목록 유지하고 Alert 창 닫기 ‘결제하기’ - 결제했다고 가정하고 목록 초기화
`````````````````````````````````````````````
<img width="452" alt="스크린샷 2020-01-10 오후 7 44 10" src="https://user-images.githubusercontent.com/57229970/72147523-0b187880-33e2-11ea-9f08-fecae606dab9.png">

<img width="452" alt="스크린샷 2020-01-10 오후 7 44 16" src="https://user-images.githubusercontent.com/57229970/72147603-3d29da80-33e2-11ea-9776-60a9d720717c.png">

<img width="452" alt="스크린샷 2020-01-10 오후 7 44 24" src="https://user-images.githubusercontent.com/57229970/72147624-4a46c980-33e2-11ea-85ca-aa7d033d1aed.png">






