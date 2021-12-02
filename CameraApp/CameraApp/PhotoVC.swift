//
//  PhotoVC.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.
//

import Foundation
import UIKit

class PhotoVC : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    let name = UILabel(frame: CGRect(x: 40, y: 200, width: 300, height: 30))
    var passedName = ""
//    let imageName = "photo"
//    let image = UIImage(named: imageName)
    let imageView = UIImageView()

    let takeAPicture = UIButton(frame: CGRect(x: 20, y: 500, width: 370, height: 80))
    let cameraView = UIImagePickerController()
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
        // Camera view
        
        self.present(cameraView, animated: true, completion: nil)
        
        //Button
        takeAPicture.backgroundColor = .red
        takeAPicture.setTitle("Take A Picture", for: .normal)
        takeAPicture.setTitleColor(UIColor.white, for: .normal)
        takeAPicture.layer.cornerRadius = 10
        takeAPicture.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        // AddSubview
        view.addSubview(name)
        view.addSubview(takeAPicture)
        view.addSubview(imageView)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = pickedImage
        picker.dismiss(animated: true, completion: nil)
        } else {
            print("Error")
        }

        
    }
    @objc func openCamera(){
        cameraView.delegate = self
        cameraView.sourceType = .camera
        cameraView.allowsEditing = false
        cameraView.showsCameraControls = true
        self.present(cameraView, animated: true, completion: nil)
    }
}
