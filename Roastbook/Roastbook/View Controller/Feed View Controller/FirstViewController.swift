//
//  FirstViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/28/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableviewFeed: UITableView!
    var arrayMusic : Array<Feed>?

    override func viewDidLoad() {
        super.viewDidLoad()
        tableviewFeed.rowHeight = UITableViewAutomaticDimension
        tableviewFeed.estimatedRowHeight = 70.0
        
        fetchFeedData()
    }

    private func fetchFeedData(){
        arrayMusic = FeedBusinessLayer.sharedInstance.getFeedInformationDataArray()
        tableviewFeed.reloadData()
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90.0
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let numberOfRow = self.arrayMusic?.count ?? 0
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        
        let curentFeed = arrayMusic?[indexPath.row]
        cell.configureCellWithData(feedInformationModelObject: curentFeed!)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

