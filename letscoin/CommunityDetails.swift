//
//  CommunityDetails.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class CommunityDetails: AnimationPresent {

    @IBOutlet weak var member: UILabel!
    @IBOutlet weak var payToCommunity: UIButton!
    @IBOutlet weak var product: UILabel!
    @IBOutlet weak var newProduct: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        member.layer.masksToBounds = true
        member.layer.cornerRadius = self.member.frame.height / 2
        product.layer.masksToBounds = true
        product.layer.cornerRadius = self.product.frame.height / 2
        newProduct.layer.masksToBounds = true
        newProduct.layer.cornerRadius = self.newProduct.frame.height / 2
        
        payToCommunity.layer.masksToBounds = true
        payToCommunity.layer.cornerRadius = self.payToCommunity.frame.height / 2
        
        // Do any additional setup after loading the view.
    }

   

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
