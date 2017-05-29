//
//  HomeViewController.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/23/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

struct HomeCollection {
    var imageName : String
    var title : String
    var notificationCount : Int
}

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var collectionViewHome: UICollectionView!
    @IBOutlet weak var tableViewHome: UITableView!
    var cameraRadialMenu :  MTZRadialMenu? = nil

//    let arrayCollectionCellData = ["df":"df"]
    static let kImageNameKey = "imageName"
    static let kTitleKey = "title"
    static let kNotificationCountKey = "title"

    var arrayCollectionCellData = [ HomeCollection(imageName: "Profile", title: "My Profile", notificationCount: 3),
                                    HomeCollection(imageName: "Associates", title: "Associates", notificationCount: 13),
                                    HomeCollection(imageName: "Mirror", title: "Mirrors", notificationCount: 20),
                                    HomeCollection(imageName: "Chapter", title: "Chapters", notificationCount: 17),
                                    HomeCollection(imageName: "Activity", title: "Activities", notificationCount: 23),
                                    HomeCollection(imageName: "ChatArena", title: "Arena", notificationCount: 0)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewHome.rowHeight = UITableViewAutomaticDimension
        tableViewHome.estimatedRowHeight = 100.0
        setRadialButton()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  //MARK: Radial menu
  func setRadialButton(){
    // Set Main Radial Menu
    let width : CGFloat = 44.0;
    let height : CGFloat = 44.0;
    let yOffset : CGFloat = self.view.frame.size.height/2
    let left = CGRect(x: 0, y: yOffset, width: width, height: height)
    
    let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.dark)
    cameraRadialMenu = MTZRadialMenu(backgroundVisualEffect: blurEffect)
    cameraRadialMenu?.frame = left;
    cameraRadialMenu?.setImage(UIImage(named: "Home"), for: .normal)
    cameraRadialMenu?.setImage(UIImage(named: "Home"), for: .highlighted)
    cameraRadialMenu?.setImage(UIImage(named: "Home"), for: .selected)
    cameraRadialMenu?.backgroundColor = UIColor.darkGray
    cameraRadialMenu?.layer.cornerRadius = 10.0
    
    self.view.addSubview(cameraRadialMenu!)
    //        self.cameraRadialMenu.delegate = self;
    
    //Set menu items now
    
    //Mirror button
    let mirrorImage = UIImage(named: "Mirror")
    let mirrorItem : MTZRadialMenuItem = MTZRadialMenuItem(image: mirrorImage, highlightedImage: mirrorImage) { (radialMenu, menuItem) in
      //print("Radial menu:- \(radialMenu)")
      //print("Menu item:- \(menuItem)")
      self.cameraRadialMenu?.dismiss(animated: true)
      let mirrorVC = self.storyboard?.instantiateViewController(withIdentifier: "MirrorViewController")
      self.navigationController?.pushViewController(mirrorVC!, animated: true)
    }
    cameraRadialMenu?.setItem(mirrorItem, for: MTZRadialMenuLocation.top)
    
    //Pages button
    let pageImage = UIImage(named: "Page")
    let pageItem : MTZRadialMenuItem = MTZRadialMenuItem(image: pageImage, highlightedImage: pageImage) { (radialMenu, menuItem) in
      self.cameraRadialMenu?.dismiss(animated: true)
      let chapterVC = self.storyboard?.instantiateViewController(withIdentifier: "ChapterViewController")
      self.navigationController?.pushViewController(chapterVC!, animated: true)
    }
    cameraRadialMenu?.setItem(pageItem, for: MTZRadialMenuLocation.right)
    
    //Settings button
    let settingImage = UIImage(named: "Setting")
    let settingItem : MTZRadialMenuItem = MTZRadialMenuItem(image: settingImage, highlightedImage: settingImage) { (radialMenu, menuItem) in
      self.cameraRadialMenu?.dismiss(animated: true)
      self.showAlert(message: "Setting pressed")
    }
    cameraRadialMenu?.setItem(settingItem, for: MTZRadialMenuLocation.bottom)
  }
    //MARK: IBActions
    @IBAction func btnNavigationDrawerAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Post media", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
          self.showAlert(message: "User can share the image/video")
        }))
      
      alert.addAction(UIAlertAction(title: "Start a Roast", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
        self.showAlert(message: "User can start a roast. User can invite his friends, post comments and images")
      }))
      
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler:{ (UIAlertAction)in
            print("Cancel")
        }))

        if let presenter = alert.popoverPresentationController {
            presenter.barButtonItem = sender
        }

        self.present(alert, animated: true, completion: {
            
        })
    }
    
  func showAlert(message:String){
    let alert = UIAlertController(title: "Pendulum", message: message, preferredStyle: .alert)
    let cancelButton = UIAlertAction(title: "Cancel", style: .default, handler: nil)
    alert.addAction(cancelButton)
    self.present(alert, animated: true, completion: nil)
  }
  
    //MARK: Collection view datasource and delegates
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.row {
        case 0: break
        case 1:
          let mirrorVC = self.storyboard?.instantiateViewController(withIdentifier: "MirrorViewController")
          self.navigationController?.pushViewController(mirrorVC!, animated: true)
          break
        case 2:
            let mirrorVC = self.storyboard?.instantiateViewController(withIdentifier: "MirrorViewController")
            self.navigationController?.pushViewController(mirrorVC!, animated: true)
            break
        case 3:
          let chapterVC = self.storyboard?.instantiateViewController(withIdentifier: "ChapterViewController")
          self.navigationController?.pushViewController(chapterVC!, animated: true)
          break
        case 4: break
        case 5: break
        default:
            break
        }
     print("did select")
    }


    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return arrayCollectionCellData.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        let dataDictionary : HomeCollection = arrayCollectionCellData[indexPath.row]
        cell.setUpContent(imageName: dataDictionary.imageName, title: dataDictionary.title, notificationCount: dataDictionary.notificationCount)
        return cell
    }
    
   
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = self.view.frame.size.width/2 - 30
        let height = self.view.frame.size.height/3 - 30
        return CGSize(width: width, height: height)
    }
  
  //MARK: Table delegates
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    var cellIdentifier = ""
    switch indexPath.row {
    case 0:
      cellIdentifier = "RoastBoxTableCell"
    case 1:
      cellIdentifier = "ContestCell"
    default:
      cellIdentifier = "RoastBoxTableCell"
    }
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch indexPath.row {
    case 0:
      self.showAlert(message: "Roast box detail view will be shown, where use can see all the punks, write comments, see photos")
    default: break
      
    }
  }
}
