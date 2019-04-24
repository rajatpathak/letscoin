//
//  welcomeCommunity.swift
//  letscoin
//
//  Created by Love on 19/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class welcomeCommunity: AnimationPresent {

    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var sendRequestOutlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        welcomLabel.text = "Welcome To \(selectedCommunityName)"
        
        
        // Do any additional setup after loading the view.
    }

    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendRequest(_ sender: UIButton) {
        sendRequestOutlet.setTitle("REQUEST SENT", for: .normal)
    }
    
}
