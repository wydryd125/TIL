//
//  LoginViewController.swift
//  AppleLoginExample
//
//  Created by Giftbot on 2020/03/17.
//  Copyright © 2020 Giftbot. All rights reserved.
//
import AuthenticationServices
import UIKit

class LoginViewController: UIViewController {
  
  @IBOutlet private weak var stackView: UIStackView!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupAppleIDButton()
  }
  
  private func setupAppleIDButton() {
    let appleIDButton = ASAuthorizationAppleIDButton(authorizationButtonType: .default, authorizationButtonStyle: .black)
    appleIDButton.layer.cornerRadius = 6.0
    appleIDButton.addTarget(self, action: #selector(didTapAppleIDButton), for: .touchUpInside)
    
    stackView.addArrangedSubview(appleIDButton)
    stackView.arrangedSubviews.first?.isHidden = true
  }
    
  
  
  // MARK: Action
  
  @objc private func didTapAppleIDButton(_ sender: Any) {
    let idRequest = ASAuthorizationAppleIDProvider().createRequest()
    idRequest.requestedScopes = [.email, .fullName]
    
    let authorizationController = ASAuthorizationController(
    authorizationRequests: [idRequest]
    )
    authorizationController.delegate = self
    
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
    }
}
extension LoginViewController: ASAuthorizationControllerDelegate {
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        guard let idCredential = authorization.credential as? ASAuthorizationAppleIDCredential ,
            let idToken = idCredential.identityToken,
            let tokenString = String(data: idToken, encoding: .utf8)
            else { return }
        
        
        let userID = idCredential.user
        let familyName = idCredential.fullName?.familyName ?? ""
        let givenName = idCredential.fullName?.givenName ?? ""
        let email = idCredential.email ?? ""
        let user = User(id: userID, familyName: familyName, givenName: givenName, email: email)
        print(user)
        
        if let encodedData = try? JSONEncoder().encode(user) {
            UserDefaults.standard.set(encodedData, forKey: "AppleIDData")
            print(encodedData)
        }
        switch idCredential.realUserStatus {
        case .likelyReal:
            print("REAL USER")
        case .unknown:
            print("unknown? real user?")
        case .unsupported:
            print("iOS user XXXX, only iOS user")
        default:
            break
        }
        
        let vc = presentingViewController as! ViewController
        vc.user = user
        dismiss(animated: true)
    }
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        guard let error = error as? ASAuthorizationError else { return }
        
        switch error.code {
        case .unknown:
            print("unknown")
        case .canceled:
            print("canceled")
        case .invalidResponse:
            print("invalidResponse")
        case .notHandled:
            print("notHandled")
        case .failed:
            print("failed")
        @unknown default:
            print("default")
            
        }
    }

    
}
extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        self.view.window!
    }
}
