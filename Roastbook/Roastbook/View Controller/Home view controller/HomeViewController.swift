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

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionViewHome: UICollectionView!
    
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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: IBActions
    @IBAction func btnNavigationDrawerAction(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Settings", style: UIAlertActionStyle.default, handler:{ (UIAlertAction)in
            print("User click Settings button")
        }))
        alert.addAction(UIAlertAction(title: "Logout", style: UIAlertActionStyle.cancel, handler:{ (UIAlertAction)in
            print("User click Dismiss button")
        }))

        if let presenter = alert.popoverPresentationController {
            presenter.barButtonItem = sender
        }

        self.present(alert, animated: true, completion: {
            
        })
    }
    
    
    //MARK: Collection view datasource and delegates
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        switch indexPath.row {
        case 0: break
        case 1: break
        case 2:
            let mirrorVC = self.storyboard?.instantiateViewController(withIdentifier: "MirrorViewController")
            self.navigationController?.pushViewController(mirrorVC!, animated: true)
            break
        case 3: break
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
}
