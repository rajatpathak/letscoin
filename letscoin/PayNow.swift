//
//  PayNow.swift
//  letscoin
//
//  Created by Love on 19/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class PayNow: AnimationPresent {

    @IBOutlet weak var popupView: UIView!
    @IBOutlet weak var popupBackground: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.popupView.isHidden = true
        self.popupBackground.isHidden = true

        // Do any additional setup after loading the view.
    }

    

    @IBAction func approve(_ sender: UIButton) {
        self.popupView.isHidden = false
        self.popupBackground.isHidden = false
    }
    @IBAction func okayButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
