//
//  Profile.swift
//  letscoin
//
//  Created by Love on 15/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import AVFoundation

class Profile: AnimationPresent {


    var imagePicker = UIImagePickerController()
    var imageName = String()
    var declarationImage: UIImage!
    var chosenImage = UIImage.init()
    
    
    @IBOutlet weak var UserImage: UIImageView!
    @IBOutlet weak var letscoinLogoView: UIView!
    @IBOutlet weak var scanAndPayButton: UIButton!
    @IBOutlet weak var requestAdminButton: UIButton!
    @IBOutlet weak var viewTransaction: UIButton!
    @IBOutlet weak var availableBalance: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.UserImage.layer.masksToBounds = true
        self.UserImage.layer.cornerRadius =  self.UserImage.frame.height / 2
        
        
        self.letscoinLogoView.layer.borderWidth = 8.0
        self.letscoinLogoView.layer.borderColor = UIColor(red: 172.0/255.0, green: 107.0/255.0, blue: 5.0/255.0, alpha: 1.0).cgColor
         self.letscoinLogoView.layer.masksToBounds = true
         self.letscoinLogoView.layer.cornerRadius =  self.letscoinLogoView.frame.height / 2
        
        self.scanAndPayButton.layer.masksToBounds = true
        self.scanAndPayButton.layer.cornerRadius =  self.scanAndPayButton.frame.height / 2
        
        self.requestAdminButton.layer.masksToBounds = true
        self.requestAdminButton.layer.cornerRadius =  self.requestAdminButton.frame.height / 2
        
        
        
        self.viewTransaction.layer.borderWidth = 1.5
        self.viewTransaction.layer.borderColor = UIColor.darkGray.cgColor
        self.viewTransaction.layer.masksToBounds = true
        self.viewTransaction.layer.cornerRadius =  self.viewTransaction.frame.height / 2
        
         self.availableBalance.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
//         Do any additional setup after loading the view.
    }

    
    @IBAction func transactionHistory(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "transaction")
    }
    @IBAction func chooseProfileImage(_ sender: UIButton) {
        chooseImagePickerMethod()
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}




//////////////////MARK : Extention for Adding Profile Picture///////////////////
extension Profile : UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func openPhotoLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.photoLibrary) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.photoLibrary
            imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func openCamera() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera
            imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
    }
    
    func checkPermissionForCamera() {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            self.openCamera()
        } else if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            self.alertPromptToAllowCameraAccessViaSetting()
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    self.openCamera()
                }
            })
        }
    }
    
    func checkPermissionForPhotos() {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            self.openPhotoLibrary()
        } else if AVCaptureDevice.authorizationStatus(for: .video) == .denied {
            self.alertPromptToAllowCameraAccessViaSetting()
        } else {
            AVCaptureDevice.requestAccess(for: .video, completionHandler: { (granted: Bool) in
                if granted {
                    self.openPhotoLibrary()
                }
            })
        }
    }
    
    func alertPromptToAllowCameraAccessViaSetting() {
        let alert = UIAlertController.init(title: "Permission Required", message: "Allow camera to take photo for your profile pic.", preferredStyle: .alert)
        let action = UIAlertAction.init(title: "Cancel", style: .default, handler: { (sender) in
            
        })
        let action1 = UIAlertAction.init(title: "Settings", style: .default, handler: { (sender) in
            UIApplication.shared.open(URL.init(string: UIApplicationOpenSettingsURLString)!, options: [ : ], completionHandler: nil)
        })
        alert.addAction(action)
        alert.addAction(action1)
        self.present(alert, animated: true, completion: nil)
    }
    
    func chooseImagePickerMethod() {
        let actionSheetController = UIAlertController(title: "Please select", message: nil, preferredStyle: .actionSheet)
        
        let openCameraAction = UIAlertAction(title: "Open Camera", style: .default) { action -> Void in
            self.checkPermissionForCamera()
        }
        let chooseFromPhotosAction = UIAlertAction(title: "Choose from Photos", style: .default) { action -> Void in
            self.checkPermissionForPhotos()
        }
        let cancelActionButton = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in  }
        
        actionSheetController.addAction(openCameraAction)
        actionSheetController.addAction(chooseFromPhotosAction)
        actionSheetController.addAction(cancelActionButton)
        self.present(actionSheetController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        chosenImage = info[UIImagePickerControllerEditedImage] as! UIImage
        self.declarationImage = chosenImage
        
        self.UserImage.contentMode = .scaleAspectFill
        self.UserImage.image = chosenImage
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated:true, completion: nil)
    }
    
    
    
}





