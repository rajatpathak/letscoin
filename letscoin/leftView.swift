//
//  leftView.swift
//  letscoin
//
//  Created by Love on 14/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class leftView: AnimationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }

    @IBAction func profileAc(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "Profile")
        
    }
    
    @IBAction func foreignExch(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "foreignExchange")
    }
    @IBAction func request(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "Request")
    }
    @IBAction func passBook(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "transaction")
    }
    @IBAction func community(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "communieT")
    }
    @IBAction func communityAdmin(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "CommunityAdmin")
    }
}
