//
//  communityListVC.swift
//  letscoin
//
//  Created by Love on 21/05/18.
//  Copyright © 2018 Love. All rights reserved.
//

import UIKit


var selectedCommunityName = String()


class communityListVC: AnimationPresent , UITableViewDelegate , UITableViewDataSource ,UISearchBarDelegate{
    
    

    
    
    var Searchcommunity = ["Community 1","Community 2","Community 3","Community 4","Community 5","Community 6","Community 7","Community 8","Community 9","Community 10"]
    var SearchcommuniteImage = ["logoo","logoo","logoo","logoo","logoo","logoo","logoo","logoo","logoo","logoo"]
    var filteredData: [String]!
    
    @IBOutlet weak var searchCommunitTableview: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.searchCommunitTableview.delegate = self
        self.searchCommunitTableview.dataSource = self
        
        self.searchBar.delegate = self
        self.filteredData = Searchcommunity
        
        
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        // When there is no text, filteredData is the same as the original data
        // When user has entered text into the search box
        // Use the filter method to iterate over all items in the data array
        // For each item, return true if the item should be included and false if the
        // item should NOT be included
        filteredData = searchText.isEmpty ? Searchcommunity : Searchcommunity.filter({(dataString: String) -> Bool in
            // If dataItem matches the searchText, return true to include it
            return dataString.range(of: searchText, options: .caseInsensitive) != nil
        })
        
        searchCommunitTableview.reloadData()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "searchCommunityCell") as! searchCommunityCell
        cell.CellView.dropShadow(color: UIColor.darkGray, opacity: 1, offSet: CGSize(width: -1, height: 1), radius: 6, scale: true)
        cell.communiteImag.image = UIImage(named: SearchcommuniteImage[indexPath.row])
        cell.communiteNam.text = self.filteredData[indexPath.row]
        cell.communiteImag.image = UIImage(named: SearchcommuniteImage[indexPath.row])
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        selectedCommunityName = filteredData[indexPath.row]
        self.viewPresent(centerPoint: self.view.center, storyBoard: "Main", viewId: "welcomeCommunity")
        tableView.deselectRow(at: indexPath, animated: true)

    }
    
    
    
    @IBAction func back(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
        
    }
}
