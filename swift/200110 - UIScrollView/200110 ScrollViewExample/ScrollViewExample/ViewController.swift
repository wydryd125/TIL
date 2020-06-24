//
//  ViewController.swift
//  ScrollViewExample
//
//  Created by giftbot on 2020. 01. 05..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit


final class ViewController: UIViewController {

  // MARK: Properties
  
  @IBOutlet private weak var scrollView: UIScrollView!
  @IBOutlet private weak var imageView: UIImageView!
    

    
    private var zoomScale : CGFloat = 1.0
  
  // MARK: LifeCycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scrollView.delegate = self
    scrollView.bounces = true
//    scrollView.alwaysBounceHorizontal = true
    updateScrollViewZoomScale()
  }
    func updateScrollViewZoomScale() {
        let widthScale = view.frame.width / imageView.bounds.width
        let heighScale = view.frame.height / imageView.bounds.height
        let minScale = min(widthScale, heighScale)
        
        scrollView.minimumZoomScale = minScale
        scrollView.zoomScale = 1
        scrollView.maximumZoomScale = 3
    }
  
  // MARK: Action Handler
  
    //사진을 최소배율로.
  @IBAction private func fitToWidth(_ sender: Any) {
    print("\n---------- [ fitToWidth ] ----------")
    zoomScale = scrollView.frame.width / imageView.bounds.width
    scrollView.setZoomScale(zoomScale, animated: true)
    print(scrollView.frame.width)
    print(scrollView.bounds.width)
    
  }
  //사진을 두배 확대
  @IBAction private func scaleDouble(_ sender: Any) {
    print("\n---------- [ scaleDouble ] ----------")
    // 더큰 값을 넣어주어도 min,max값을 지정해주었기 때문에 바뀌지 않음.
    scrollView.setZoomScale(zoomScale * 2, animated: true)
    print(zoomScale)
    zoomScale = scrollView.zoomScale
    print(zoomScale)
    
    let rectToVisible = CGRect(x: 100, y: 100, width: 200, height: 300)
    scrollView.zoom(to: rectToVisible, animated: true)
  }

  @IBAction private func moveContentToLeft(_ sender: Any) {
    print("\n---------- [ moveContentToLeft ] ----------")
    let newOffSet = CGPoint(x: scrollView.contentOffset.x + 150,
                            y: scrollView.contentOffset.y)
    scrollView.setContentOffset(newOffSet, animated: true)
    
  }
}
extension ViewController : UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        imageView
    }
    //scrollview가 이동할때.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("꺄아아아아아")
    }
}
