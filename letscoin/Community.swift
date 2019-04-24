//
//  Community.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class Community: AnimationPresent , UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var categoryOne: UICollectionView!
    @IBOutlet weak var categoryTwo: UICollectionView!
    @IBOutlet weak var profile: UIButton!
    
    var catOneProductName = ["Bags","Bags","Bags","Bags","Bags","Bags","Bags","Bags","Bags",]
    var catOneProductImage = ["person","person","person","person","person","person","person","person","person"]
    var catOnePrice = ["12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC"]
    var catTwoProductName = ["Bags","Bags","Bags","Bags","Bags","Bags","Bags","Bags","Bags",]
    var catTwoProductImage = ["person","person","person","person","person","person","person","person","person"]
    var catTwoPrice = ["12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC","12.0LC"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.categoryOne.delegate = self
        self.categoryTwo.delegate = self
        self.categoryOne.dataSource = self
        self.categoryTwo.dataSource = self
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == categoryOne{
            return 1
        }
        else if collectionView == categoryTwo{
            return 1
        }
        else{
         return 1
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryOne{
            return catOneProductName.count
        }
        else if collectionView == categoryTwo{
            return catTwoProductName.count
        }
        else{
            return 0
        }
//        return names.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryOne{
         let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryOne", for: indexPath) as! CategoryOne
            
        
            cell.productName.text = self.catOneProductName[indexPath.row]
            cell.productImage.image = UIImage(named: catOneProductImage[indexPath.row])
            cell.productPrce.text = self.catOnePrice[indexPath.row]
           
//            cell.layer.borderColor = UIColor.gray.cgColor
//            cell.layer.borderWidth = 2.0
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 4.0
            cell.CatOneView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
            return cell

        }
        else if collectionView == categoryTwo{
          let cellTwo = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryTwo", for: indexPath) as! CategoryTwo
           
            cellTwo.productNameCatTwo.text = self.catTwoProductName[indexPath.row]
            cellTwo.productImageCatTwo.image = UIImage(named: catTwoProductImage[indexPath.row])
            cellTwo.productPrceCatTwo.text = self.catTwoPrice[indexPath.row]
            cellTwo.layer.masksToBounds = true
            cellTwo.layer.cornerRadius = 4.0
//            cellTwo.layer.borderColor = UIColor.gray.cgColor
//            cellTwo.layer.borderWidth = 2.0
            cellTwo.catTwoView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
            return cellTwo

        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryTwo", for: indexPath)
            return cell
        }
        
    }
   
    @IBAction func profileAc(_ sender: UIButton) {
        
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "CommunityDetails")
        
    }
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension Community : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: 151, height: 193)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
}
}
