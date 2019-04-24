//
//  myCommunityCell.swift
//  letscoin
//
//  Created by Love on 19/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class myCommunityCell: UITableViewCell {

    @IBOutlet weak var communityImage: UIImageView!
    @IBOutlet weak var communityName: UILabel!
    @IBOutlet weak var communityView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
