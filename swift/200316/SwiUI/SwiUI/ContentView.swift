//
//  ContentView.swift
//  SwiUI
//
//  Created by 정유경 on 2020/03/16.
//  Copyright © 2020 정유경. All rights reserved.
//

import SwiftUI

struct ContentView: View { // 기존에 UIView였는데 swiftUI에서는 View라는 protocol을 채택하고 body 프로퍼티를 반환해야한다
//MARK: TEXT
//    var body: some View { // some associate
//        VStack(spacing: 30){
//         Text("Hello, 유꽁")
//            .font(.headline)
//            .foregroundColor(.red) // 폰트컬러
//            .fontWeight(.bold) // -> 폰트 종류
//            //----------------------------------위 반환타입 Text, 아래 View
//            // 반환타입 Text와 View는 공통으로 사용할 수 없다. 메소드 체이닝 떄문에 사용순서를 좁은 개념부터 포괄적인 개념으로 점점 넓혀서 사용해야함
//            .colorInvert() // -> 컬러 반전
//
//            Text("SwiftUI")
//                .foregroundColor(.white)
//                .padding() // 패딩이 먼저적용하고 백그라운드 메소드를 입력하면 패딩 크기 만큼 백그라운 컬러도 설정된다.(패딩은 텍스트 크기만큼 설정)
//                .background(Color.blue)
//
//            Text("커스텀폰트, 볼드체, 이탤릭체, 밑줄, 취소선")
//                .font(.custom("Menlo", size: 16))
//                .bold()
//                .italic()
//                .underline()
//                .strikethrough()
//
//            Text("fkdlstn wpgksrhk \n텍스트 정렬 기능입니다, \n이건 안보이죠?")
//            .lineLimit(2)
//                .multilineTextAlignment(.trailing)
//
//            (Text("wkrksrhk rlwnstjs").kerning(8)
//                + Text("   조정도 쉽게 가능합니다.").baselineOffset(-20))
//                .font(.system(size: 20))
//
//        }
//
//    }
    
//MARK:: image
//    var body: some View {
//        VStack(spacing: 30) {
//            Image("placeholder")
//                .resizable() // 2.이 메소드를 사용해야 이미지 크기가 바뀜.
//                .frame(width: 200, height: 200) //1. 이미지 크기가 아니라 뷰의 크기가 바뀜...ㅠ
            
//            Image("placeholder")
//            .resizable()
//                .frame(width: 50, height: 50)
//
//            Image("placeholder")
//                .resizable(resizingMode: .tile) //-> 사이즈에 맞게 이미지가 타일식으로 들어감.
//            .frame(width: 100, height: 100)
            
//            Image("placeholder")
//                .resizable(capInsets: .init(top: 0, leading: 50, bottom: 0, trailing: 0)) // leading 0-50 영역은 고정하고 나머지 부분만 늘림.
//            .frame(width: 300, height: 300)
//
//            Image("placeholder")
//            .resizable()
//            .scaledToFit() // UIKit 기준 - Aspect Fit
////            .scaledToFill() // UIKit 기준 - Aspect Fill
//            .frame(width: 200, height: 300)
//            .clipped()
//
//            Image("placeholder").clipShape(
//                Rectangle().inset(by: 5)
//            )
//            Image("placeholder").clipShape(
//            Ellipse()
//                .path(in: CGRect(x: 0, y: 0, width: 80, height: 100))
//            )
//            Image(systemName: "person")
//                .renderingMode(.original)
//                .font(.largeTitle)
//            
//            Image(systemName: "person")
//                .renderingMode(.template)
//                .font(.largeTitle)
//
//        }
//        .foregroundColor(.orange)
//    }
            
//MARK: Stack
//    var body: some View {
        //--------------------------------------HStack
//        HStack(alignment: .top) { //가로
             //.top -> Hstack의 크기가 달라졌을때 정렬방식
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 150, height: 250)
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 150, height: 150)
            
//            Text("HStack")
//                .font(.title)
//                .foregroundColor(Color.blue)
//            Text("은 뷰를 가로로 배열합니다")
//            Text("!")
//            Spacer() // 텍스트보다 앞에 있으면 스페이스가 앞에 생긴다
//                .frame(width: 100)
//
//            Text("Spacer")
//                .font(.title)
//                .background(Color.blue)
//
//        }
//        .padding()
//        .border(Color.black)
//        .font(.largeTitle)
//        .background(Color.orange)
//    }

//        //---------------------------------------ZStack
//  var body: some View {
//        ZStack() { //계층
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 150, height: 150)
//
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 140, height: 140)
//                .offset(x: 40, y: 40)
//                .zIndex(10) // 숫자가 큰게 맨앞으로
//
//            Rectangle()
//                .fill(Color.yellow)
//                .frame(width: 200, height: 200)
//                .offset(x: 80, y: 80)
//                .zIndex(9)
//
//
//        }
//    }
//    //-------------------------------VStack
//    var body: some View {
//    VStack() {
//        Text("제목")
//            .font(.largeTitle)
//        Text("부제목")
//            .foregroundColor(Color.gray)
//        Spacer()
//        Text("본문 내용")
//        Spacer()
//        Rectangle()
//            .fill(Color.green)
//            .frame(width: 150, height: 150)
//            .background(Rectangle()
//                .fill(Color.yellow)
//                .offset(x:40, y: 40)
//        )
//        Spacer()
//        Text("각주")
//            .font(.body)
//        }
//
//    }
    
    //MARK: List
//    //------------------------------------텍스트뷰
//    var body: some View {
//        List(0..<100) { // 텍스트뷰
//         Text("\($0)")
//
//        }
//      //---------------------------------컬렉션뷰 비스무리
//    var body: some View {
//    return List {
//            ForEach(0..<100) { i in
//                Section(header: Text("Header").font(.title).background(Color.gray),
//                        footer:
//                    Text("Footer").font(.body)
//                )
//
//            }
//        }
//    }
    //-------------------------Button 만들기, navigationbar 만들기
    @State var count = 0
    //State 키워드 꼭 작성해야함.
    
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
//MARK: Group
// 프리뷰를 여러개 사용할수 있다.
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
//        Group {
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
//                .previewDisplayName("SwiftUI")
//            
//            ContentView()
//                .previewDevice(PreviewDevice(rawValue: "iPad"))
//                .previewDisplayName("SwiftUI Preview")
//            
//        }
        ForEach(["iPhone 8", "iPhone 11 Pro","iPhone 11 Pro Max","iPhone 8 Plus"], id: \.self) { device in
            VStack(spacing: 30) {
                ContentView()
                    .previewDevice(PreviewDevice(rawValue: device))
                    .previewDisplayName(device)
                
                ContentView()
                .flipsForRightToLeftLayoutDirection(true)
                    .environment(\.layoutDirection, .rightToLeft)
            }
        }
    }
}

