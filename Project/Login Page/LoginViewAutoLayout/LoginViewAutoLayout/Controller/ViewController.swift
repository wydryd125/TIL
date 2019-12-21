//
//  ViewController.swift
//  LoginViewAutoLayout
//
//  Created by 정유경 on 2019/12/18.
//  Copyright © 2019 정유경. All rights reserved.
//

import UIKit

//-> 로그인 첫화면
class ViewController: UIViewController {
    
    //-> 똑같은 뷰를 재사용하기 위해, MVC 패턴을 활용한 customView를 생성 -> 여기서는 한번밖에 안썼음.
    let myView = LoginView(frame: .zero)
    
    //-> tempText는 임시저장, 16글자 이상일때 이후의 값을 받지 않고, 이전의 값을 표현해주기 위함
    var tempText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(myView)
        baseUI()
        setLoginView()
        
        //-> mailtextfield의 델리게이트를 현재 뷰컨트롤러에서 사용하기 위해 선언해줌
        myView.mailTextField.delegate = self
    }
    
    func baseUI() {
        //-> sign in! 버튼이 눌렸을때 일어나는~~
        myView.signInButton.addTarget(self, action: #selector(didTapbutton), for: .touchUpInside)
        //-> sign up! 버튼이 눌렸을때 일어나는~~
        myView.signUpButton.addTarget(self, action: #selector(signUpDidTapButton), for: .touchUpInside)
        
    }
    
    func setLoginView() {
        
        //-> customview의 오토레이아웃을 설정.
        myView.translatesAutoresizingMaskIntoConstraints = false
        
        myView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        myView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        myView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        myView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    @objc func didTapbutton() {
        //-> 메일, 패스워드 텍스트필드가 비어있는지 1차 확인
        guard
            let mail = myView.mailTextField.text,
            !mail.isEmpty,
            let pass = myView.passTextField.text,
            !pass.isEmpty
            else { return }
        
        //-> 입력받은 이메일이 유저디폴트에 저장되어 있거나 비밀번호가 일치하지 않는지 2차 확인, 맞지않으면 백그라운드 컬러 레드!!!!!!
        guard let udPass = UserDefaults.standard.string(forKey: mail), udPass == pass else {
            myView.mailTextField.backgroundColor = .red
            myView.passTextField.backgroundColor = .red
            
            //-> 레드였던 백그라운드 컬러를 다시 흰색으로 돌려돌려!
            UIView.animate(withDuration: 1.5) {
                self.myView.mailTextField.backgroundColor = .white
                self.myView.passTextField.backgroundColor = .white
            }
            
            //-> 이메일과 비밀번호가 맞지 않으므로 alert창 띄워줌. alert창은 밑에서 만들어줌
            alert(message: "로그인 정보가 틀립니다.")
            return
        }
        //-> 조건이 맞으면 유저디폴트에 저장.
        UserDefaults.standard.set(mail, forKey: "mail")
      
        //-> 그리고 다음페이지로 넘겨준다.
        let vc = SecondViewController()
        present(vc, animated: true)
    }
    
    //->회원가입버튼 눌렀을때
    @objc func signUpDidTapButton() {
        //-> 회원가입 페이지로 이동
        let loginVC = SignUpViewController()
        present(loginVC, animated: true)
        
    }
    //-> alert창 생성
    func alert(message: String) {
        let alertController = UIAlertController(title: "경고", message: message, preferredStyle: .alert)
        
        let cancel = UIAlertAction(title: "닫 기", style: .default)
        //-> alert창에 cancel액션 추가
        alertController.addAction(cancel)
        //-> alert창 띄워줌
        present(alertController, animated: true)
    }
    
}

extension ViewController: UITextFieldDelegate {
    //-> 텍스트필드에 입력값이 들어올때마다~~~
    func textFieldDidChangeSelection(_ textField: UITextField) {
       //-> 텍스트필드의 값은 옵셔널로 반환되기 때문에 옵셔널 바인딩함.
        guard let text = textField.text else { return }
        //-> 텍스트필드의 글자수가 16보다 크면
        if text.count > 16 {
            //-> tempText의 값을 입력
            textField.text = tempText
        } else {
            //-> 16보다 작으면 text를 임시 저장
            tempText = text
        }
    }
    //-> 텍스트필드가 선택되었을때(클릭)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        //-> 0.3초만에
        UIView.animate(withDuration: 0.3) {
            //-> 뷰의 바텀으로부터 간격을 300 올리겠다.
            self.myView.buttonConstraint?.constant = -300
           //-> layoutITNeeded - 뷰컨트롤러에서 기본적으로 제공되는 메서드, 컨스트레인트가 변경되었을때 반영되도록 함.
            self.view.layoutIfNeeded()
        }
        return true
    }
    
    //-> 텍스트필드 키보드의 enter키를 눌렀을때
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //-> 키보드를 내림
        textField.resignFirstResponder()
        
        UIView.animate(withDuration: 0.3) {
            //-> 아까 올린 뷰를 원상복구 하겠다.
            self.myView.buttonConstraint?.constant = -100
            //-> layoutITNeeded - 뷰컨트롤러에서 기본적으로 제공되는 메서드, 컨스트레인트가 변경되었을때 반영되도록 함.
            self.view.layoutIfNeeded()
        }
        
        return true
    }
}




