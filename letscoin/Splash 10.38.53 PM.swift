//
//  Splash.swift
//  letscoin
//
//  Created by Love on 14/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class Splash: AnimationPresent {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute: {
            self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "login")
        })
        
        // Do any additional setup after loading the view.
    }


}
