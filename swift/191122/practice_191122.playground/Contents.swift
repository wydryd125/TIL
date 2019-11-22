//: A UIKit based Playground for presenting user interface

import UIKit
import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.frame.size = CGSize(width: 375, height: 667)
        view.backgroundColor = .white
        
        self.view = view
    }
    override func viewDidLoad() {
        
// practice 1-2
    
        let blueView = setupSuperView()
//practice 1-2
        let blueView2 = setupSuperView2()
//practice 2
        let ssuperView = setupSuperView3()
        let superView = setupSuperView4()
        let miniView = setupSuperView5()
    
    }
    
    
    
    
func setupSuperView2() -> UIView {
    let blueView2 = UIView()
    blueView2.frame = CGRect(x: 15, y: 552, width: 345, height: 100)
    blueView2.backgroundColor = .blue
    view.addSubview(blueView2)
    return blueView2
    }
    
    func setupSuperView() -> UIView {
        let blueView = UIView()
        blueView.frame = CGRect(x: 15, y: 15, width: 345, height: 100)
        blueView.backgroundColor = .blue
        view.addSubview(blueView)
        return blueView
    }
    
    func setupSuperView3() -> UIView {
        let ssuperView = UIView()
        ssuperView.frame = CGRect(x: 30, y: 30, width: 315, height: 607)
        ssuperView.backgroundColor = .green
        view.addSubview(ssuperView)
        return ssuperView
    
    }
    
    func setupSuperView4() -> UIView {
        let superView = UIView()
        superView.frame = CGRect(x: 60, y: 60, width: 255, height: 547)
        superView.backgroundColor = .red
        view.addSubview(superView)
        return superView
    }
    
    func setupSuperView5() -> UIView {
        let miniview = UIView()
        miniview.frame = CGRect(x: 90, y: 90, width: 195, height: 487)
        miniview.backgroundColor = .purple
        view.addSubview(miniview)
        return miniview
        
    }
    

    
}




















// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()
