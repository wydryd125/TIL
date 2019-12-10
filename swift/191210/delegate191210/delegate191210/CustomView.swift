//
//  CustomView.swift
//  delegate191210
//
//  Created by 정유경 on 2019/12/10.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

// 1. 프로토콜 정의
protocol CustomViewDelegate: class {
    func colorForBackground(_ newColor : UIColor?) -> UIColor
}


class CustomView: UIView {
    
    // 2. delegate 프로퍼티 선언
    weak var delegate: CustomViewDelegate?
    
    //-> 배경색을 바꿀때마다 출력됨.
    override var backgroundColor: UIColor? {
        get { super.backgroundColor } //-> B.color return
        set { //3. delegate 메서드호출
                               //->옵셔널 체이닝으로 인해 UIColor 옵셔널
            let color = delegate?.colorForBackground(newValue)
            //-> delegate에게 물어봄 - color~ 함수를 실행시킬테니까 컬러로 돌려줘~~~~
            let newColor = color ?? newValue ?? .black
            //-> delegate에게 물어봄 - 너가 컬러를 지정해주면 쓸건데 지정안해주면 뉴벨류를 그대로 쓸게~  그게 nil면 블랙으로 쓸게
            super.backgroundColor = newValue
        
        }
    }
}
