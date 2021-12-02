//
//  ViewController.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.
//

import UIKit

class LoginVC: UIViewController {
    
    let userName = UITextField(frame: CGRect(x: 50, y: 100, width: 300, height: 30))
    let password = UITextField(frame: CGRect(x: 50, y: 150, width: 300, height: 30))
    let loginBuuton = UIButton(frame: CGRect(x: 120, y: 200, width: 120, height: 30))
    let loginStatus = UILabel(frame: CGRect(x: 80, y: 300, width: 300, height: 30))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        userName.placeholder = "Enter ur username"
        userName.borderStyle = .roundedRect
        
        password.placeholder = "Enter ur password"
        password.borderStyle = .roundedRect
        password.isSecureTextEntry = true
        
        loginBuuton.setTitle("Login", for: .normal)
        loginBuuton.addTarget(self, action: #selector(loginButtonClicked), for: .touchUpInside)
        loginBuuton.backgroundColor = .orange
        loginBuuton.layer.cornerRadius = 8
        
        view.addSubview(userName)
        view.addSubview(password)
        view.addSubview(loginBuuton)

    }
    
    @objc func loginButtonClicked(){
        if userName.text == "Aaa" && password.text == "123"{
            let vc = PhotoVC(name: userName.text!)
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true)
        }
        else{
            loginStatus.text = "Worng password or username"
            userName.clear()
            password.clear()
            
        }
    }
}

extension UITextField {
    func clear(){
        self.text = ""
    }
}

