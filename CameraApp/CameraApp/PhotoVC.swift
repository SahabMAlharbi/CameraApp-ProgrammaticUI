//
//  PhotoVC.swift
//  CameraApp
//
//  Created by WjdanMo on 02/12/2021.
//

import Foundation
import UIKit

class PhotoVC : UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    
    let name = UILabel(frame: CGRect(x: 38, y: 80, width: 300, height: 30))
    var passedName = ""
    
    let imageView = UIImageView(frame: CGRect(x: 10, y: 140, width: 360, height: 500))
    let takeAPicture = UIButton(frame: CGRect(x: 90, y: 660, width: 200, height: 40))
    let cameraView = UIImagePickerController()
    let saveAPicture = UIButton(frame: CGRect(x: 90, y: 730, width: 200, height: 40))
    init(name: String){
        self.passedName = "\(name)'s Photo"
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        // super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        name.text = passedName
        name.textColor = .black
        name.textAlignment = .center
        name.font = UIFont(name: "AppleSDGothicNeo-Bold", size: 17)
        
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8

        takeAPicture.backgroundColor = .black
        takeAPicture.setTitle("Take A Picture", for: .normal)
        takeAPicture.setTitleColor(UIColor.white, for: .normal)
        takeAPicture.layer.cornerRadius = 20
        takeAPicture.addTarget(self, action: #selector(openCamera), for: .touchUpInside)
        
        saveAPicture.backgroundColor = .black
        saveAPicture.setTitle("save  A Picture", for: .normal)
        saveAPicture.setTitleColor(UIColor.white, for: .normal)
        saveAPicture.layer.cornerRadius = 20
        saveAPicture.addTarget(self, action: #selector(save), for: .touchUpInside)

        view.addSubview(name)
        view.addSubview(takeAPicture)
        view.addSubview(imageView)
        view.addSubview(saveAPicture)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
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
    
    @objc func save(_ sender: AnyObject) {
        guard let selectedImage = imageView.image else {
            print("Image not found!")
            return
        }
        UIImageWriteToSavedPhotosAlbum(selectedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    @objc func image(_ imagee: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer){
        if let error = error{
            let ac = UIAlertController(title: "Error while saving", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Success!", message: "The Image has been saved successfully", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }

}
