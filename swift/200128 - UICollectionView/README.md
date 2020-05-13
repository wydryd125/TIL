# TIL
## Today I Learned


## 2020.01.28 - UICollectionView

### UICollectionView
- 정렬된 자료들을 사용자가 원하는 형식에 맞게 유연하게 표현할 수 잇는 객체
- UICollectionView는 UITableView 같이 dataSource 와 delegate를 이용해 데이터를 collection 형식으로 화면에 표시하는 object

### Three types of visual elements
- 셀 (Cell)
	- 컬렉션 뷰의 단일 데이터 항목을 표현하는 개체
	- 각 셀은 다중 섹션으로 나누거나 하나의 그룹으로만 묶어 표현할 수 있음
	- 컬렉션 뷰의 컨텐츠 영역에 셀들을 배열하는 것이 레이아웃 객체의 주 업무
	
- 보조 뷰 (Supplementary views)
	- header와 footer 같은 역할을 하는 뷰
	
	```swift
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,referenceSizeForHeaderInSection section: Int) -> CGSize
	
	func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,referenceSizeForFooterInSection section: Int) -> CGSize
	```
	
	- 셀처럼 데이터를 표현할 수 있는 것은 같지만, 유저가 선택할 수 없는 뷰
	- 높이를 0으로 설정하면 미생성
	
- 장식 뷰 ( Decoration views)
	- 컬렉션 뷰의 배경을 꾸미는 데 사용하는 시각적 장식용 뷰
	- 유저가 선택할 수 없고 레이아웃 객체를 통해 정의

### UICollectionView vs UITableView
- UITableView와 달리 UICollectionViewLayout object를 통해 UICollectionView 에서 cell의 위치 및 크기를 설정해야함.

<img width="509" alt="스크린샷 2020-05-13 오후 5 08 28" src="https://user-images.githubusercontent.com/57229970/81787693-626b5880-953c-11ea-86bd-de27bfdcc848.png">

### CollectionViewLayout

- UICollectionView에서 cell 및 decoration views들의 크기 및 위치를 설정하는 object. 화면에 나타내는 방법과 관련된 속성을 설정할 수 있음
  - UICollectionView를 생성할 때 반드시 layout object를 설정해야한다.

<img width="529" alt="스크린샷 2020-05-13 오후 6 03 52" src="https://user-images.githubusercontent.com/57229970/81793271-1cb28e00-9544-11ea-8930-c1299c8f0102.png">

### FlowLayout
- UICollectionViewFolwLayout Class
- Scroll Direction - Vertical / Horizontal

### Secion Layout
- itemSize : Cell의 크기 지정

- minimumLineSpacing : Scroll direction 방향으로 cell 사이의 너비 지정 (Cell Spacing)

- minimumInteritemSpacing : Scroll direction의 수직 방향으로 cell 사이의 너비 지정 (Line Spacing)

- sectionInset : Content의 UICollectionView 안쪽에서의 너비. UIEdgeInsets (Section Inset)

  

 <img width="352" alt="스크린샷 2020-05-13 오후 6 12 43" src="https://user-images.githubusercontent.com/57229970/81794178-5afc7d00-9545-11ea-8f02-dc8eb7f00ac5.png">

  


### UICollectionViewDelegateFlowLayout Protocol

```swift

protocol UICollectionViewDelegateFlowLayout : UICollectionViewDelegate {
	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize

	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets

	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat

	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumInteritemSpacingForSectionAt section: Int) -> CGFloat

	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,referenceSizeForHeaderInSection section: Int) -> CGSize

	optional func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,referenceSizeForFooterInSection section: Int) -> CGSize
}

 
```

### Layout Metrics

<img width="428" alt="스크린샷 2020-05-13 오후 6 27 13" src="https://user-images.githubusercontent.com/57229970/81795718-618bf400-9547-11ea-8229-8e60d29bb531.png">



``````````````````````````````````````````
[ task ]
> 10장의 이미지를 x 2 해서 20개 아이템으로 만들어 콜렉션뷰에 표시 (세로 방향 스크롤)
> 각 아이템을 선택했을 때 체크 아이콘 표시 (체크 이미지 : SF Symbol - checkmark.circle.fill)
  + 선택되어 있는 느낌이 나도록 별도 효과 주기 (영상 참고, 효과는 변경 가능)
> 삭제 버튼을 눌렀을 때 체크표시 되어 있는 아이템들을 삭제
> 20개의 아이템이 모두 삭제되었을 경우는 다시 반복할 수 있도록 처음 20개 상태로 복구
> 손가락 2개로 터치 후 드래그했을 때 아이템이 다중 선택/해제될 수 있도록 구현  (이 기능은 샘플 영상에 없음)
> 한 라인에 지정된 개수만큼의 아이템이 나타나도록 처리 (4를 지정하면 한 라인에 4개의 아이템 출력)

``````````````````````````````````````````

<img width="452" alt="스크린샷 2020-01-28 오후 11 13 35" src="https://user-images.githubusercontent.com/57229970/73271803-9f793c80-4224-11ea-915d-48718d5dfc41.png">


`````````````````````````````````
headerView, FooterView 이용하기
``````````````````````````````````````````````


![스크린샷 2020-01-31 오후 6 10 47](https://user-images.githubusercontent.com/57229970/73526716-214fac80-4455-11ea-84df-1606acd0ea03.png)

