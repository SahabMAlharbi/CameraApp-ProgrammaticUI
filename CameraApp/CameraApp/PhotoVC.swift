//
//  PhotoVC.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.
//

import Foundation
import UIKit

class PhotoVC : UIViewController{
    
    let name = UILabel(frame: CGRect(x: 40, y: 200, width: 300, height: 30))
    var passedName = ""
    
    init(name: String){
        self.passedName = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBlue
        name.text = passedName
        name.textColor = .white
        
        view.addSubview(name)
    }
    
    
    
}
