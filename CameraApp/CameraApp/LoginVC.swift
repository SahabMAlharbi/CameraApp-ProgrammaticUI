//
//  ViewController.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.

import Foundation
import UIKit

class LoginVC: UIViewController {
    
    let welcomeMsg = UILabel(frame: CGRect(x: 36, y: 150, width: 300, height: 80))
    let name = UITextField(frame: CGRect(x: 40, y: 300, width: 300, height: 30))
    let password = UITextField(frame: CGRect(x: 40, y: 340, width: 300, height: 30))
    let loginStatus = UILabel(frame: CGRect(x: 80, y: 380, width: 300, height: 30))
    let loginButton = UIButton(frame: CGRect(x: 130, y: 400, width: 120, height: 40))
    let signUpLabel = UILabel(frame: CGRect(x: 40, y: 460, width: 300, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        welcomeMsg.textColor = .black
        welcomeMsg.textAlignment = .center
        welcomeMsg.text = "Welcome to your Camera App"
        welcomeMsg.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 25)
        welcomeMsg.numberOfLines = 2
        
        name.attributedPlaceholder = NSAttributedString(
            string : "Enter your name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        name.textColor = .black
        name.borderStyle = .roundedRect
        name.backgroundColor = .white
        
        password.attributedPlaceholder = NSAttributedString(
            string : "Enter your password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray]
        )
        password.textColor = .black
        password.borderStyle = .roundedRect
        password.backgroundColor = .white
        password.isSecureTextEntry = true
        
        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginButton.backgroundColor = .black
        loginButton.layer.cornerRadius = 20
        
        signUpLabel.text = "You don't have an account? SignUp"
        signUpLabel.textColor = .black
        signUpLabel.textAlignment = .center
        signUpLabel.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        
        loginStatus.textColor = .black
        
        view.addSubview(welcomeMsg)
        view.addSubview(name)
        view.addSubview(password)
        view.addSubview(loginButton)
        view.addSubview(signUpLabel)
        view.addSubview(loginStatus)
    }
    
    @objc func loginButtonClicked(){
//        if name.text == "Aaa" && password.text == "123"{
            let vc = PhotoVC(name: name.text!)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
//        }
//        else{
//            loginStatus.text = "Worng password or username"
//            name.clear()
//            password.clear()
//        }
    }
}

extension UITextField {
    func clear(){
        self.text = ""
    }
}

