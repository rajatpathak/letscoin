//
//  Request.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import SkyFloatingLabelTextField

class Request: AnimationPresent {

    @IBOutlet weak var selectPurposeView: UIView!
    @IBOutlet weak var radioButtonOne: UIButton!
    @IBOutlet weak var radioButtonTwo: UIButton!
    @IBOutlet weak var radioButtonThree: UIButton!
    @IBOutlet weak var radioButtonFour: UIButton!
    
    @IBOutlet weak var fulllName: SkyFloatingLabelTextField!
    @IBOutlet weak var Email: SkyFloatingLabelTextField!
    @IBOutlet weak var AccountNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var MobileNumber: SkyFloatingLabelTextField!
    @IBOutlet weak var popupButtonView: UIView!
    
    @IBOutlet weak var fullNamw: UIView!
    @IBOutlet weak var emailV: UIView!
    @IBOutlet weak var accountNumbe: UIView!
    @IBOutlet weak var mobileNumberV: UIView!
    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupBackground: UIView!
    
    @IBOutlet weak var popupOkay: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectPurposeView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
        self.popupView.isHidden = true
        self.popupButtonView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        self.popupView.layer.masksToBounds = true
        self.popupView.layer.cornerRadius = 5.0
        self.popupBackground.isHidden = true

        fullNamw.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        emailV.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        accountNumbe.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        mobileNumberV.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        popupOkay.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
        // Do any additional setup after loading the view.
    }

    
    
    
    
    
    @IBAction func radioButtons(_ sender: UIButton) {
        if sender.tag == 1 {
            
            radioButtonOne.setImage(UIImage(named: "radio-on-button"), for: .normal)
            radioButtonTwo.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonThree.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonFour.setImage(UIImage(named: "radio-off-button"), for: .normal)
            
        }
        else if sender.tag == 2{
            radioButtonOne.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonTwo.setImage(UIImage(named: "radio-on-button"), for: .normal)
            radioButtonThree.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonFour.setImage(UIImage(named: "radio-off-button"), for: .normal)
        }
        else if sender.tag == 3{
            radioButtonOne.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonTwo.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonThree.setImage(UIImage(named: "radio-on-button"), for: .normal)
            radioButtonFour.setImage(UIImage(named: "radio-off-button"), for: .normal)
        }
        else if sender.tag == 4{
            radioButtonOne.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonTwo.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonThree.setImage(UIImage(named: "radio-off-button"), for: .normal)
            radioButtonFour.setImage(UIImage(named: "radio-on-button"), for: .normal)
        }
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func okay(_ sender: UIButton) {
        self.popupView.isHidden = true
        self.popupBackground.isHidden = true
    }
    @IBAction func send(_ sender: UIButton) {
        self.popupBackground.isHidden = false
        self.popupView.isHidden = false
    }
}
