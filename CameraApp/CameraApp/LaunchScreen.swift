//
//  LaunchScreen.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.
//

import Foundation
import UIKit

class LaunchScreen : UIViewController{
    
    let logo = UIImageView(image: UIImage(named: "appIcon"))
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        logo.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        logo.center = view.center
        view.addSubview(logo)
    }
    
    
    
}
