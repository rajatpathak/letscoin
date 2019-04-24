//
//  transaction.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit


class transaction: AnimationPresent , UITableViewDelegate , UITableViewDataSource {
    
    
var names = ["Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR."]
    var namesLastTransaction = ["Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR.","Robert Drowney JR."]
    var image = ["person","person","person","person","person","person","person","person","person"]
    
    var imageLastTransaction = ["person","person","person","person","person","person","person","person","person"]
    
    var lastTransaction_Date = ["21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017","21 Nov 2017"]
    
    var amount = ["+300","-300","+300","-300","+300","-300","+300","-300","-300"]
    @IBOutlet weak var lastTransactions: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.lastTransactions.delegate = self
        self.lastTransactions.dataSource = self
        self.lastTransactions.allowsSelection = false
        self.lastTransactions.separatorStyle = .none
        
    }
    
    
    ///////////UI COLLECTION VIEW DELEGATES

   
    
    ////////////UI TABLE VIEW DELEGATES
    
    

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesLastTransaction.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "lastTransactions") as! lastTransactions
        
        cell.senderName.text = self.namesLastTransaction[indexPath.row]
        cell.senderImage.image = UIImage(named: imageLastTransaction[indexPath.row])
        cell.date.text = self.lastTransaction_Date[indexPath.row]
        cell.amount.text = amount[indexPath.row]
        cell.senderImage.layer.masksToBounds = true
        cell.senderImage.layer.cornerRadius = cell.senderImage.frame.height / 2
        cell.transactionView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
        if amount[indexPath.row].first! == "+"{
            cell.amount.textColor = UIColor.green
        }
        else if amount[indexPath.row].first! == "-"{
            cell.amount.textColor = UIColor.red
        }
        return cell
    }
    
    
    
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


extension transaction : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: 89, height: 111)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
}

