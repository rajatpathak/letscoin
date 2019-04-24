//
//  signUp.swift
//  letscoin
//
//  Created by Love on 14/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import DTTextField
import CountryPicker
import Alamofire

var code = String()
let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
class signUp: AnimationPresent , CountryPickerDelegate {

    @IBOutlet weak var name: DTTextField!
    @IBOutlet weak var country: DTTextField!
    @IBOutlet weak var mobileNumber: DTTextField!
    @IBOutlet weak var bankUserNumber: DTTextField!
    @IBOutlet weak var password: DTTextField!
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var nameImage: UIImageView!
    @IBOutlet weak var numberImage: UIImageView!
    @IBOutlet weak var bunImage: UIImageView!
    
    
    var CountryPick = CountryPicker()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.name.dtborderStyle = .none
        self.name.placeholderColor = UIColor.lightGray
        self.name.floatPlaceholderColor = UIColor.lightGray
        self.name.floatPlaceholderActiveColor = UIColor.lightGray
        
        self.country.dtborderStyle = .none
        self.country.placeholderColor = UIColor.lightGray
        self.country.floatPlaceholderColor = UIColor.lightGray
        self.country.floatPlaceholderActiveColor = UIColor.lightGray
        
        
        
        
        
        
        self.mobileNumber.dtborderStyle = .none
        self.mobileNumber.placeholderColor = UIColor.lightGray
        self.mobileNumber.floatPlaceholderColor = UIColor.lightGray
        self.mobileNumber.floatPlaceholderActiveColor = UIColor.lightGray
        
        self.bankUserNumber.dtborderStyle = .none
        self.bankUserNumber.placeholderColor = UIColor.lightGray
        self.bankUserNumber.floatPlaceholderColor = UIColor.lightGray
        self.bankUserNumber.floatPlaceholderActiveColor = UIColor.lightGray
        
        self.password.dtborderStyle = .none
        self.password.placeholderColor = UIColor.black
        self.password.floatPlaceholderColor = UIColor.black
        self.password.floatPlaceholderActiveColor = UIColor.black
        
        checkBoxButton.setImage(UIImage(named:"chekBox_Unchecked"), for: .normal)
        checkBoxButton.setImage(UIImage(named:"chekBox_checked"), for: .selected)
        
        
        
        let locale = Locale.current
        let code = (locale as NSLocale).object(forKey: NSLocale.Key.countryCode) as! String?
        //init Picker
//        CountryPick.displayOnlyCountriesWithCodes = ["DK", "SE", "NO", "DE"] //display only
//        CountryPick.exeptCountriesWithCodes = ["RU"] //exept country
        let theme = CountryViewTheme(countryCodeTextColor: .white, countryNameTextColor: .white, rowBackgroundColor: .black, showFlagsBorder: false)        //optional for UIPickerView theme changes
        CountryPick.theme = theme //optional for UIPickerView theme changes
        CountryPick.countryPickerDelegate = self
        CountryPick.showPhoneNumbers = true
        CountryPick.setCountry(code!)
        
        self.country.inputView = CountryPick
        
        
        // Do any additional setup after loading the view.
    }

    
    func countryPhoneCodePicker(_ picker: CountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        //pick up anythink
        country.text = name
        mobileNumber.text = phoneCode
        code = phoneCode
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

    @IBAction func signUp(_ sender: UIButton) {
        
      //  self.present(appDelegate.centerContainer as UIViewController, animated: true, completion: nil)
        
        
        if self.name.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Enter Name", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            nameImage.isHidden = true
            
        }
        else if self.country.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Select Country", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else if self.mobileNumber.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Enter Your MobileNumber", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            numberImage.isHidden = true

        }
        else if self.bankUserNumber.text == ""
        {
            bunImage.isHidden = true

        }
        else if self.password.text == ""
        {
            let alert = UIAlertController(title: "Alert", message: "Enter Your Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        }
        else if self.checkBoxButton.currentImage! != UIImage(named: "chekBox_checked")
        {
            let alert = UIAlertController(title: "Alert", message: "Agree To T&C's", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
        else{
            
            nameImage.isHidden = false
            bunImage.isHidden = false
            numberImage.isHidden = false
            
            let urlSignup = "http://underdevelopment.in/demo/test/lc/api/api/user_reg/"
            
            let parameters : [String : Any] = ["user_name":"\(name.text!)","user_country":"\(country.text!)","user_device_type":"iOS","user_mobile":"\(mobileNumber.text!)","user_password":"\(password.text!)","user_bun":"\(bankUserNumber.text ?? "" )","user_fcm_token":"","_token":"485b552aeea39d47cffc0a33819146e5","user_img":""]
            
            Alamofire.request(urlSignup, method: .post, parameters: parameters).validate().responseString { (response) in
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
}
