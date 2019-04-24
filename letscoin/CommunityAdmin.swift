//
//  CommunityAdmin.swift
//  letscoin
//
//  Created by Love on 21/05/18.
//  Copyright © 2018 Love. All rights reserved.
//    var bounds = UIScreen.main.bounds


import UIKit

class CommunityAdmin: UIViewController ,UICollectionViewDelegate , UICollectionViewDataSource  {

    @IBOutlet weak var payementCollectionView: UICollectionView!
    @IBOutlet weak var balanceView: UIView!
    @IBOutlet weak var transactionHistoryAdmin: UICollectionView!
    
    var bounds = UIScreen.main.bounds

    
    var payReq = ["John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe"]
    var mobile_Number = ["M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx"]
    var amount = ["2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540"]
    
    var message = ["Request For LC","Request For LC","Request For LC","Request For LC","Request For LC","Request For LC","Request For LC","Request For LC","Request For LC","Request For LC"]
      var image = ["person","person","person","person","person","person","person","person","person","person"]
    
    
    ///bottom collection vie3w///
    
    var name = ["John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe","John Doe"]
    var ID = ["2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540","2,540"]
    var PrsonImage = ["person","person","person","person","person","person","person","person","person","person"]
    var UpDown = ["up-arrow (4)","up-arrow (4)","up-arrow (4)","up-arrow (4)","up-arrow (4)","down-arrow","down-arrow","down-arrow","down-arrow","down-arrow"]
    
    ///////////////////////////./
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: bounds.size.width - 32, height: payementCollectionView.frame.height)
        layout.scrollDirection = .horizontal
        payementCollectionView.collectionViewLayout = layout
        
        transactionHistoryAdmin.delegate = self
        transactionHistoryAdmin.dataSource = self
        payementCollectionView.delegate = self
        payementCollectionView.dataSource = self
        
        
        self.balanceView.layer.masksToBounds = true
        self.balanceView.layer.cornerRadius = 10.0
        
         self.balanceView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
        // Do any additional setup after loading the view.
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return amount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == payementCollectionView{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "communityAdminCollectionViewCell", for: indexPath) as! communityAdminCollectionViewCell
            
            
            
            cell.personName.text = self.payReq[indexPath.row]
            cell.personMobile.text = self.mobile_Number[indexPath.row]
            cell.requestForLC.text = self.message[indexPath.row]
            cell.Amount.text = self.amount[indexPath.row]
            cell.personImage.image = UIImage(named: image[indexPath.row])
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 6.0
            cell.payNowButton.tag = indexPath.row
            cell.payNowButton.addTarget(self, action: #selector(Paynow(sender:)), for: .touchUpInside)
            return cell
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "adminCellTwo", for: indexPath) as! adminCellTwo
            
            
            cell.personImage.layer.masksToBounds = true
            cell.personImage.layer.cornerRadius = 6.0
            cell.layer.masksToBounds = true
            cell.layer.cornerRadius = 6.0
//            cell.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 8, scale: true)
            cell.layer.borderColor = UIColor.black.cgColor
            cell.layer.borderWidth = 1.0
            
            cell.personImage.image = UIImage(named: PrsonImage[indexPath.row])
            cell.personName.text = name[indexPath.row]
            cell.id.text = ID[indexPath.row]
            cell.addOrSubImage.image = UIImage(named: UpDown[indexPath.row])
            
            return cell
            
        }
        
    }
    
   
    @objc func Paynow(sender: UIButton!){
//        viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "PayNow")
//        print("\(sender.tag)")
    }
    
  
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension CommunityAdmin : UICollectionViewDelegateFlowLayout{
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        if collectionView == payementCollectionView{
            
           return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        }
        else{
            return UIEdgeInsets(top: 20, left: 5, bottom: 10, right: 0)
        }
        
    }
    
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
        if collectionView == payementCollectionView{
            let collectionViewWidth = collectionView.bounds.width
            let collectionViewHeight = collectionView.bounds.height
            return CGSize(width: collectionViewWidth, height: collectionViewHeight)
        }
        else{
            let collectionViewWidth = collectionView.bounds.width
            return CGSize(width: collectionViewWidth/2 - 12, height: 80)
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

