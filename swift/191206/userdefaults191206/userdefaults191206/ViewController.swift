//
//  ViewController.swift
//  userdefaults191206
//
//  Created by 정유경 on 2019/12/06.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var displayLabel: UILabel!
    @IBOutlet weak var mySwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let name = UserDefaults.standard.string(forKey: "name") {
            displayLabel.text = name
            imageView.image = UIImage(named: name)
        }
        
        let isOn = UserDefaults.standard.bool(forKey: "switchIsOn")
        mySwitch.setOn(isOn, animated: true)
        
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        
        switch sender.isOn {
        case true:
            UserDefaults.standard.set("cat", forKey: "name")
            UserDefaults.standard.set(true, forKey: "switchIsOn")
            displayLabel.text = "cat"
            imageView.image = UIImage(named: "cat")
            
        case false:
            UserDefaults.standard.set("dog", forKey: "name")
            UserDefaults.standard.set(false, forKey: "switchIsOn")
            displayLabel.text = "dog"
            imageView.image = UIImage(named: "dog")
        }
    }
    
}
/*
 
 
 
 class ViewController: UIViewController {
  
 
 struct Key {
    static let imagePicker = "ImagePickerSwitch"
  }
  
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var titleLabel: UILabel!
  @IBOutlet private weak var imagePicker: UISwitch!
  
 let userDefaults = UserDefaults.standard
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    let isOn = userDefaults.bool(forKey: Key.imagePicker)
    imagePicker.setOn(isOn, animated: false)
    configureData(isOn: isOn)
  
  }
 
 @IBAction private func switchChanged(_ sender: UISwitch) {
    print("\n---------- [ 저장 상태 확인 ] ----------\n")
    configureData(isOn: sender.isOn)
    userDefaults.set(sender.isOn, forKey: Key.imagePicker)
    print(userDefaults.bool(forKey: Key.imagePicker))
  }
  
  func configureData(isOn: Bool) {
    let animal = isOn ? "dog" : "cat"
    imageView.image = UIImage(named: animal)
    titleLabel.text = animal
 

  
  }
}










 */
