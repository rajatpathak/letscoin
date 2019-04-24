//
//  transfer.swift
//  letscoin
//
//  Created by Love on 15/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class transfer: AnimationPresent , UITextFieldDelegate{

    @IBOutlet weak var selectPurposeView: UIView!
    @IBOutlet weak var radioButtonOne: UIButton!
    @IBOutlet weak var radioButtonTwo: UIButton!
    @IBOutlet weak var radioButtonThree: UIButton!
    @IBOutlet weak var radioButtonFour: UIButton!
    @IBOutlet weak var viewContainingAmountAndMoney: UIView!
    @IBOutlet weak var amountView: UIView!
    @IBOutlet weak var amountTF: UITextField!
    @IBOutlet weak var mobileNumberTF: UITextField!
    @IBOutlet weak var mobileNumbrrView: UIView!
    @IBOutlet weak var countryCode: UILabel!
    
    @IBOutlet weak var transactionSucessFullPopup: UIView!
    @IBOutlet weak var transactionMobileNumber: UILabel!
    @IBOutlet weak var transaconID: UILabel!
    @IBOutlet weak var moneySentAmount: UILabel!
    @IBOutlet weak var LcSentSucessfully: UILabel!
    @IBOutlet weak var lcSentButton: UIButton!
    @IBOutlet weak var popupBackground: UIView!
    
    //    var buttonTag : Int = 0
    
   
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupBackground.isHidden = true
//        self.transactionSucessFullPopup.alpha = 0.0
        self.transactionSucessFullPopup.isHidden = true
 
        self.LcSentSucessfully.layer.masksToBounds = true
        self.LcSentSucessfully.layer.cornerRadius = self.LcSentSucessfully.frame.height / 2
        
        
        IQKeyboardManager.shared.enable = false
        
         amountTF.delegate = self
        selectPurposeView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)
       viewContainingAmountAndMoney.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        mobileNumbrrView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        
        countryCode.text = code
        NotificationCenter.default.addObserver(self, selector: #selector(transfer.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(transfer.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
       
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
    
    @objc func keyboardWillShow(sender: NSNotification) {
        self.view.frame.origin.y = -150 // Move view 150 points upward
    }
    
    @objc func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position

    
    }
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        animateViewMoving(up: true, moveValue: 145)
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        animateViewMoving(up: false, moveValue: 145)
//    }
//    func animateViewMoving (up:Bool, moveValue :CGFloat){
//        let movementDuration:TimeInterval = 0.3
//        let movement:CGFloat = ( up ? -moveValue : moveValue)
//        UIView.beginAnimations( "animateView", context: nil)
//        UIView.setAnimationBeginsFromCurrentState(true)
//        UIView.setAnimationDuration(movementDuration )
//        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
//        UIView.commitAnimations()
//    }
//
    
    @IBAction func lcSentButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func payNow(_ sender: UIButton) {
        self.transactionMobileNumber.text = "\(String(describing: self.countryCode.text!)) \(String(describing: self.mobileNumberTF.text ?? ""))"
        self.moneySentAmount.text = "LC: \(String(describing: self.amountTF.text!))"
        self.transactionSucessFullPopup.isHidden = false
        self.popupBackground.isHidden = false

    }
    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    
    }
}
