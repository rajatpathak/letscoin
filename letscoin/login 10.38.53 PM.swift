//
//  login.swift
//  letscoin
//
//  Created by Love on 14/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import DTTextField
import Alamofire

class login: AnimationPresent, UITextFieldDelegate {

    @IBOutlet weak var mobileNumber: DTTextField!
    @IBOutlet weak var password: DTTextField!
    @IBOutlet weak var checkboxButton: UIButton!
    @IBOutlet weak var numberImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.mobileNumber.dtborderStyle = .none
        self.mobileNumber.placeholderColor = UIColor.lightGray
        self.mobileNumber.floatPlaceholderColor = UIColor.lightGray
        self.mobileNumber.floatPlaceholderActiveColor = UIColor.lightGray
       
        
        
        self.password.dtborderStyle = .none
        self.password.placeholderColor = UIColor.black
        self.password.floatPlaceholderColor = UIColor.black
        self.password.floatPlaceholderActiveColor = UIColor.black
        
        
        mobileNumber.delegate = self
        password.delegate = self
        let imageViewUsername = UIImageView()
        let imageUsername = UIImage(named: "envelope")
        imageViewUsername.image = imageUsername
        imageViewUsername.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
        imageViewUsername.contentMode = UIViewContentMode.scaleAspectFit
        mobileNumber.addSubview(imageViewUsername)
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.mobileNumber.frame.height))
        mobileNumber.leftView = paddingView
        mobileNumber.leftViewMode = UITextFieldViewMode.always
        
        let imageViewPassword = UIImageView()
        let imagePassword = UIImage(named: "unlocked")
        imageViewPassword.image = imagePassword
        imageViewPassword.frame = CGRect(x: 0, y: 10, width: 20, height: 20)
        imageViewPassword.contentMode = UIViewContentMode.scaleAspectFit
        password.addSubview(imageViewPassword)
        let paddingvu = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: self.password.frame.height))
        password.leftView = paddingvu
        password.leftViewMode = UITextFieldViewMode.always
        
        
        self.mobileNumber.delegate = self
        self.password.delegate = self
        
        checkboxButton.setImage(UIImage(named:"chekBox_Unchecked"), for: .normal)
        checkboxButton.setImage(UIImage(named:"chekBox_checked"), for: .selected)
        // Do any additional setup after loading the view.
    }

    @IBAction func checkbox(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            sender.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }) { (success) in
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
                sender.isSelected = !sender.isSelected
                sender.transform = .identity
            }, completion: nil)
        }
        
        if sender.isSelected == true{
            print("unchecked")
        }
        else{
            print("checked")
            
        }
    }
    
    
    
    @IBAction func login(_ sender: UIButton) {
        
        
        if self.mobileNumber.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Enter Email ID", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            numberImage.isHidden = true
            
        }
        else if self.password.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Enter Your Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            
            
        
            numberImage.isHidden = false

        let urlLogin = "http://underdevelopment.in/demo/test/lc/api/api/user_login/"
        
        let parameters : [String : Any] = ["user_mobile":"\(mobileNumber.text!)","user_password":"\(password.text!)","user_device_type":"iOS"]
        
        Alamofire.request(urlLogin, method: .post, parameters: parameters).validate().responseString { (response) in
            switch response.result{
            case .success:
                
                let responseCode = response.response?.statusCode
                print("\(String(describing: responseCode))")
                if let dictonary = response.value{
                    print(dictonary)
                    let JsonDict = self.convertToDictionary(text: dictonary)
                    if JsonDict!["status"] as! String == "success"{
                        let message = JsonDict!["message"]
                        print("code sent")
                        print(message)
                         self.present(appDelegate.centerContainer as UIViewController, animated: true, completion: nil)
                        
                    }
                    else if JsonDict!["status"] as! String == "failed"{
                        let message = JsonDict!["message"]
                        print("not a user")
                        let alert = UIAlertController(title: "Alert", message: "\(message!)", preferredStyle: UIAlertControllerStyle.alert)
                        alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                    }
                    
                }
                
                break
                
            case .failure(let error):
                print(error)
                print("error in loggin in")
                
                break
            }
        }
        
        }
        
    }
    
    func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    @IBAction func signup(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "signUp")
        
        
        
        
    }
    
}
