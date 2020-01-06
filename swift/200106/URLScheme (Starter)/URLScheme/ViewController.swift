//
//  ViewController.swift
//  URLScheme
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
  
  @IBAction private func openSetting(_ sender: Any) {
    print("\n---------- [ openSettingApp ] ----------\n")
    guard let url = URL(string: UIApplication.openSettingsURLString),
        UIApplication.shared.canOpenURL(url) else { return }
    
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openMail(_ sender: Any) {
    print("\n---------- [ openMail ] ----------\n")
    //메일을 눌렀을때 밑의 주소로 메일 보낼 수 있음. 받는 사람을 다중으로 보내고 싶으면 ,메일
    //let scheme = "mailto:someone@mail.com,someone2@mail.com"
    //소문참조는 cc->bcc
    let scheme = "mailto:?cc=foo@bar.com&subject=title&body=Mytext"
    
    guard let url = URL(string: scheme),
        UIApplication.shared.canOpenURL(url)
        else{ return }
    UIApplication.shared.open(url)
    
    
  }

  @IBAction private func openMessage(_ sender: Any) {
    print("\n---------- [ openMessage ] ----------\n")
//    let url = URL(string:"sms:")!
    let url = URL(string: "sms:010-4904-5436&body=Hello")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
  
  @IBAction private func openWebsite(_ sender: Any) {
    print("\n---------- [ openWebsite ] ----------\n")
    let url = URL(string: "http://google.com")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
    
  }
  //--여기까지 시스템 앱
    
  //--여기서부터 3rd Party
    
    
  @IBAction private func openFacebook(_ sender: Any) {
    print("\n---------- [ openFacebook ] ----------\n")
   // 최초 1회 넘어갈 때 이동을 허락하면 이후부터는 바로 넘어감
    // 3rd Party 앱에 대해서 화이트리스트 등록필요
   
    /* 화이트리스트 등록
     info.plist 오른쪽 마우스 - 오픈에즈 - 소스코드 dict마지막에
     <key>LSApplicationQueriesSchemes</key>
     <array>
      <string>fb</string>
      <string>myApp</string>
     </array> 붙여넣고 - 오픈에즈 - 프로퍼티리스트*/

    
    let url = URL(string: "instagram:")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
  
  @IBAction private func openMyApp(_ sender: Any) {
    print("\n---------- [ openMyApp ] ----------\n")
    
    /* my app://host?name=abc%age=10
     - scheme: myApp
     - host: host
     - query: name=abc%age=10*/
    
    
//    let url = URL(string: "myApp")!
    let url = URL(string: "myApp://host?name=abc&age=10")!
    
    guard UIApplication.shared.canOpenURL(url) else { return }
    UIApplication.shared.open(url)
  }
}




