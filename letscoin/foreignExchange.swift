//
//  foreignExchange.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class foreignExchange: AnimationPresent ,UICollectionViewDelegate , UICollectionViewDataSource {

    let screen = UIScreen.main.bounds

    @IBOutlet weak var requestView: UIView!
    @IBOutlet weak var backbroundPopUp: UIView!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var EmailId: UITextField!
    @IBOutlet weak var foreignExch: UICollectionView!
    @IBOutlet weak var Amount: UITextField!
    @IBOutlet weak var requestButton: UIButton!
    
    var exchRate = ["67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD","67.5 USD"]
    override func viewDidLoad() {
        super.viewDidLoad()
        backbroundPopUp.isHidden = true
        foreignExch.delegate = self
        foreignExch.dataSource = self
        requestView.isHidden = true
//        name.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
//        phoneNumber.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
//        EmailId.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
//        Amount.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)

        requestButton.layer.borderColor = UIColor.black.cgColor
        requestButton.layer.borderWidth = 1.0
        requestButton.layer.cornerRadius = requestButton.frame.height / 2
        requestButton.layer.masksToBounds = true
        
        
        
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.exchRate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "foreignExchCell", for: indexPath) as! foreignExchCell
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5.0
       cell.rate.text = exchRate[indexPath.row]
        
        
        return cell
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func REQUEST(_ sender: UIButton) {
        backbroundPopUp.isHidden = true
        requestView.isHidden = true
    }
    
    @IBAction func requstLC(_ sender: UIButton) {
        requestView.isHidden = false
        backbroundPopUp.isHidden = false
    }

}




extension foreignExchange : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 10)
    }

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: foreignExch.frame.width / 4, height: foreignExch.frame.height / 5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

