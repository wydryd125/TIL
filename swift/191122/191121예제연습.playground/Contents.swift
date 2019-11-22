//: A UIKit based Playground for presenting user interface
  
import UIKit

import PlaygroundSupport

class MyViewController : UIViewController {
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white
        view.frame.size = CGSize(width: 350, height: 700)
        self.view = view
    }
    
    override func viewDidLoad() {
        let blueView = setupSuperview(superView: view, color: .blue)
        let redView = setupSuperview(superView: blueView, color: .red)
        let greenView = setupSuperview(superView: redView, color: .green)
//        greenView.frame.origin = CGPoint(x: 200, y: 200)
//        greenView.bounds.origin = CGPoint(x: 50, y: 50)
    }
    
    func setupSuperview(superView: UIView, color: UIColor) -> UIView {
        let subview = UIView()
        subview.backgroundColor = color
        subview.frame = CGRect(x: 30, y: 30, width: superView.frame.width - 60, height: superView.frame.height - 60)
        superView.addSubview(subview)
        return subview
    }
}
// Present the view controller in the Live View window
let vc = MyViewController()
vc.preferredContentSize = CGSize(width: 350, height: 700)
PlaygroundPage.current.liveView = vc
