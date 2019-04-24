//
//  communityListCell.swift
//  letscoin
//
//  Created by Love on 16/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class communityListCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var communiName: UILabel!
    @IBOutlet weak var communityMembers: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
