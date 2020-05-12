# TIL
## Today I Learned


## 2020.03.16 - SwiftUI

### SwiftUI
- 모든 애플 플랫폼에서 사용자 인터페이스를 만들 수 있게 해주는 새로운 개발 패러다임
> - SwiftUI는 Declarative 구문을 사용한다
> - 실시간으로 UI 미리보기를 제공함.
> - UI 변수 연결인 outlets나 action등을 체크하여 런타임때의 fail의 위험을 감소
> - 자바의 스윙, React Nativ와 같은 멀티 플랫폼 프레임워크

###  SwiftUI의 호환성
- iOS 13,  macOS 10.15, tvOS 13, watchOS 6 이후의 운영체제에서 실행

### UIKit -> SwiftUI
- import UIkit -> import SwiftUI

```
UITableView: List
UICollectionView: No SwiftUI equivalent
UILabel: Text
UITextField: TextField
UITextField with isSecureTextEntry set to true: SecureField
UITextView: No SwiftUI equivalent
UISwitch: Toggle
UISlider: Slider
UIButton: Button
UINavigationController: NavigationView
UIAlertController with style .alert: Alert
UIAlertController with style .actionSheet: ActionSheet
UIStackView with horizontal axis: HStack
UIStackView with vertical axis: VStack
UIImageView: Image
UISegmentedControl: SegmentedControl
UIStepper: Stepper
UIDatePicker: DatePicker
NSAttributedString: Incompatible with SwiftUI; use Text instead.
```
### AutoLayout
- H/VStack, Groups등 을 사용 하여 코드 작성

  - VStack으로 정렬한 Button과 Navigation bar 
```SwiftUI
    @State var count = 0
    
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                NavigationLink(destination: Text("ASDFGH")) {
                Image("placeholder")
                }
                NavigationLink(destination: Text("ASDFGH111")) {
                Text("ABC")
                }
            Text("\(count)")
            
            Button("Count Up!") {
                self.count += 1
            }
            
        }
        .font(.largeTitle)
        .navigationBarTitle("Swift UI")
        .navigationBarItems(trailing: Image(systemName: "bell"))
            
        }
    }
    
}
````
<img src = "https://user-images.githubusercontent.com/57229970/81675238-76a24d80-9489-11ea-8396-950ed7fb6606.png" hight = 30% width = 30%></img>

<img src = "https://user-images.githubusercontent.com/57229970/81675257-80c44c00-9489-11ea-825b-a029fb806f71.png" hight = 30% width = 30%></img>


