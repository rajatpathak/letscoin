//
//  searchCommunityCell.swift
//  letscoin
//
//  Created by Love on 21/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class searchCommunityCell: UITableViewCell {
    @IBOutlet weak var communiteNam: UILabel!
    @IBOutlet weak var communiteImag: UIImageView!
    @IBOutlet weak var CellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
