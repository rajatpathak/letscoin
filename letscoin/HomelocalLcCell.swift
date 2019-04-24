//
//  HomelocalLcCell.swift
//  letscoin
//
//  Created by Love on 15/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class HomelocalLcCell: UITableViewCell {

    @IBOutlet weak var personName: UILabel!
    @IBOutlet weak var paymentMode: UILabel!
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var payementDateAndNumber: UILabel!
    @IBOutlet weak var payementAmount: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
