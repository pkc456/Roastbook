//
//  ChapterViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/30/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class ChapterViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   let identifier = "ChapterCel"

  @IBOutlet weak var tableviewChapter: UITableView!
//  var arrayMirrors = [MirrorContentItem]()
  
    override func viewDidLoad() {
      super.viewDidLoad()
      self.title = "Chapter"
      setUpNavBarButton()
      
      tableviewChapter.rowHeight = UITableViewAutomaticDimension
      tableviewChapter.estimatedRowHeight = 10.0
    }
  
  private func setUpNavBarButton(){
    let search = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.search, target: nil, action: nil)
    self.navigationItem.rightBarButtonItem = search
  }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let numberOfRow = 3//self.arrayMusic?.count ?? 0
    return numberOfRow
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var identi = ""
    
    switch indexPath.row
    {
      case 0:
        identi = "ChapterTableViewCell"
      case 1:
        identi = "ChapterTableViewCell2"
      case 2:
        identi = "ChapterTableViewCell3"
      default:
        identi = "ChapterTableViewCell"
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: identi, for: indexPath) as! ChapterTableViewCell
    
    return cell
    
    
    /*
    let cell: UITableViewCell = {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: identifier) else {
        return UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifier)
      }
      return cell
    }()

    
    cell.textLabel?.text = "Teen talak"
    cell.detailTextLabel?.text = "75 %"
    cell.imageView?.image = UIImage(named: "second")
    return cell
    */

  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
  }

}
