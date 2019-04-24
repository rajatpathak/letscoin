//
//  mainView.swift
//  letscoin
//
//  Created by Love on 14/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class mainView: AnimationPresent ,UICollectionViewDelegate , UICollectionViewDataSource , UITableViewDelegate , UITableViewDataSource {
  
    var bounds = UIScreen.main.bounds
    
    @IBOutlet weak var internationalLCImage: UIImageView!
    @IBOutlet weak var localLcImage: UIImageView!
    @IBOutlet weak var notification: UICollectionView!
    @IBOutlet weak var notificationCellView: UIView!
    @IBOutlet weak var lcTableView: UITableView!
    @IBOutlet weak var scsnPayButtom: UIButton!
    @IBOutlet weak var notificationCount: UILabel!
    
    ///////collectionviewData///////
    
     var payReq = ["Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John","Payment Request from John"]
    var mobile_Number = ["M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx","M: +xx xxxxxxxxxx"]
    var message = ["Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount.","Hey! Please transfer the amount."]
    var date = ["DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE","DD - 17 JUNE"]
    var amount = ["LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540","LC 2,540"]
    
    
    
    ///////tableview Data//////
    var payeename = ["Alexa","Alexa","Alexa","Alexa","Alexa","Alexa","Alexa","Alexa","Alexa","Alexa"]
    var payementAmount = ["2300LC","2300LC","2300LC","2300LC","2300LC","2300LC","2300LC","2300LC","2300LC","2300LC"]
    var RecOrSend = ["Recive","Recive","Recive","Recive","Sent","Sent","Recive","Recive","Recive","Sent"]
    var DateAndNumber = ["15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx","15 June : +xx xxxxxxxxxx"]
    
    let logoContainer = UIView(frame: CGRect(x: 0, y: 0, width: 41, height: 41))
    
    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 41, height: 41))
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.notificationCellView.dropShadow(color: .darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        self.notificationCount.text = "\(amount.count)"
        self.lcTableView.allowsSelection = false
        self.notificationCellView.dropShadow()
        
        self.notification.delegate = self
        self.notification.dataSource = self
        
        let layout = UPCarouselFlowLayout()
        layout.itemSize = CGSize(width: bounds.size.width - 32, height: notification.frame.height)
        layout.scrollDirection = .horizontal
        notification.collectionViewLayout = layout
        
        self.lcTableView.delegate = self
        self.lcTableView.dataSource = self
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "logoo")
        imageView.image = image
        logoContainer.addSubview(imageView)
        navigationItem.titleView = logoContainer
//        self.payButton.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
        
//        self.payButton.addTarget(self, action: #selector(ButtonAction(_:)), for: .touchUpInside)
    }

//   @objc func ButtonAction(_ sender: UIButton!) {
//        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "transfer")
//
//    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return amount.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "notificationCell", for: indexPath) as! notificationCell
        
        cell.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 3, scale: true)

        cell.payementRequest.text = self.payReq[indexPath.row]
        cell.mobileNumber.text = self.mobile_Number[indexPath.row]
        cell.payementComment.text = self.message[indexPath.row]
        cell.payementDate.text = self.date[indexPath.row]
        cell.lcAmount.text = self.amount[indexPath.row]
        
        cell.ignore.addTarget(self, action: #selector(Ignore(sender:)), for: .touchUpInside)
        cell.paynow.tag = indexPath.row
        cell.paynow.addTarget(self, action: #selector(Paynow(sender:)), for: .touchUpInside)
        cell.ignore.tag = indexPath.row
        
        return cell
    }
    
    @objc func Ignore(sender: UIButton!){
        print("\(sender.tag)")
        payReq.remove(at: sender.tag)
        mobile_Number.remove(at: sender.tag)
        message.remove(at: sender.tag)
        date.remove(at: sender.tag)
        amount.remove(at: sender.tag)
        
        self.notification.reloadData()
    }
    
    @objc func Paynow(sender: UIButton!){
        viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "PayNow")
        print("\(sender.tag)")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payeename.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomelocalLcCell") as! HomelocalLcCell
        cell.personName.text = self.payeename[indexPath.row]
        cell.payementAmount.text = self.payementAmount[indexPath.row]
        cell.paymentMode.text = self.RecOrSend[indexPath.row]
        cell.payementDateAndNumber.text = self.DateAndNumber[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    
    @IBAction func localAndInterNationalLC(_ sender: UIButton) {
        if sender.tag == 1{
//            White
            internationalLCImage.image = UIImage(named: "White")
            localLcImage.image = UIImage(named: "align-justify")
            self.lcTableView.isHidden = false
            
        }
        else if sender.tag == 2{
            localLcImage.image = UIImage(named: "White")
            internationalLCImage.image = UIImage(named: "align-justify")
            self.lcTableView.isHidden = true

        }
    }
    
    
    @IBAction func leftMenu(_ sender: UIBarButtonItem) {
        let appDelegate:AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.centerContainer.toggle(.left, animated: true, completion: nil)
    }
   

    @IBAction func scanAndPay(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "transfer")
//
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "transfer") as! transfer
//        self.present(vc, animated: true, completion: nil)
    }

    
}
