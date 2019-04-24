//
//  communieT.swift
//  letscoin
//
//  Created by Love on 19/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit

class communieT: AnimationPresent ,UITableViewDelegate , UITableViewDataSource , UISearchBarDelegate{
    
   var mycommunity = ["Community 1","Community 2"]
    var communiteImage = ["logoo","logoo"]
    
   
    
  
    
    @IBOutlet weak var My_Community: UIButton!
    @IBOutlet weak var Search_Community: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var selectCountry: UITextField!
    @IBOutlet weak var selectCity : UITextField!
    @IBOutlet weak var selectState: UITextField!
    @IBOutlet weak var searchCommunityView: UIView!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        var lineArray = self.text.components(separatedBy: "\n") // Separating Lines
        
     
        
        self.My_Community.tag = 1
        self.Search_Community.tag = 2
        
        self.searchCommunityView.isHidden = true
        self.tableView.isHidden = false
        
        
        self.My_Community.setTitleColor(UIColor.black, for: .normal)
         self.My_Community.setTitleColor(UIColor(red: 192.0/255.0, green: 106.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: UIControlState.selected)
        
        self.Search_Community.setTitleColor(UIColor.black, for: .normal)
        self.Search_Community.setTitleColor(UIColor(red: 192.0/255.0, green: 106.0/255.0, blue: 0.0/255.0, alpha: 1.0), for: UIControlState.selected)
        

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 85

    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return mycommunity.count

        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "myCommunityCell") as! myCommunityCell
            cell.communityName.text = self.mycommunity[indexPath.row]
            cell.communityImage.image = UIImage(named: communiteImage[indexPath.row])
            cell.communityView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
            return cell
    }
    
    

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
         if tableView == self.tableView{
            self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "Community")
            tableView.deselectRow(at: indexPath, animated: true)

            
        }
        else{
            
        }
        
       
    }
    
    @IBAction func communityListAndSearchCommunity(_ sender: UIButton) {
        if sender.tag == 1{
          self.searchCommunityView.isHidden = true
            self.tableView.isHidden = false
            self.My_Community.titleLabel?.textColor = UIColor(red: 192.0/255.0, green: 106.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            self.Search_Community.titleLabel?.textColor = UIColor.black
            
        }
        else if sender.tag == 2{
            self.searchCommunityView.isHidden = false
            self.tableView.isHidden = true
            self.Search_Community.titleLabel?.textColor = UIColor(red: 192.0/255.0, green: 106.0/255.0, blue: 0.0/255.0, alpha: 1.0)
            self.My_Community.titleLabel?.textColor = UIColor.black
            
        }
    }
    
    @IBAction func search(_ sender: UIButton) {
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "communityListVC")
        
    }
    @IBAction func back(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        

        
    }
}
