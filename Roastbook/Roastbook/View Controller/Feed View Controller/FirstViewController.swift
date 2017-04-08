//
//  FirstViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/28/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var tableviewFeed: UITableView!
    var arrayMusic : Array<Feed>?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 90.0
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberOfRow = 0
        numberOfRow = self.arrayMusic?.count ?? 0
        return numberOfRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedTableViewCell", for: indexPath) as! FeedTableViewCell
        
        var musicArrayBasedOnTable : Array<Feed>?
        musicArrayBasedOnTable = self.arrayMusic
        
        
        if musicArrayBasedOnTable != nil && musicArrayBasedOnTable!.count >= indexPath.row
        {
            cell.configureCellWithData(musicInformationModelObject: (musicArrayBasedOnTable?[indexPath.row])!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

