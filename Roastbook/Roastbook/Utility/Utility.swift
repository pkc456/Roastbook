//
//  Utility.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/29/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation
import UIKit

class Utility: NSObject
{
    class var sharedInstance: Utility {
        struct Static {
            static let instance: Utility = Utility()
        }
        return Static.instance
    }
  
  //Show Loading indicator
  static var activityBaseView:UIView=UIView()
  
  static func showLoader() {
    activityBaseView.frame=(APP_DELEGATE.window?.frame)!
    activityBaseView.backgroundColor=UIColor.white
    activityBaseView.alpha=0.6;
    
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    activityIndicator.center = activityBaseView.center
    activityIndicator.hidesWhenStopped = true
    activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
    activityBaseView.addSubview(activityIndicator)
    activityIndicator.startAnimating()
    
    APP_DELEGATE.window?.addSubview(activityBaseView)
  }
  
  static func hideLoader()
  {
    activityBaseView.removeFromSuperview()
  }
    //MARK:- User detail mdodel object save and retrive
     func saveUserDetails()
    {
        let datos = NSKeyedArchiver.archivedData(withRootObject: APP_DELEGATE.userDetail)
        UserDefaults.standard.set(datos, forKey: KKEY_USER_DETAIL)
        UserDefaults.standard.synchronize()
    }
    
    func getUserDetail() -> UserDetail?
    {
        let decoded  = UserDefaults.standard.object(forKey: KKEY_USER_DETAIL) as? NSData
        var decodedObject : UserDetail?
        if(decoded != nil)
        {
            decodedObject = NSKeyedUnarchiver.unarchiveObject(with: decoded as! Data) as? UserDetail
            return decodedObject!
        }
        return decodedObject
    }    
    
}

//MARK:- UIView controller Extension
extension UIViewController{
  func showAlert(title: String?, message: String?){
    let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) -> Void in
    }))
    
    self.present(alert, animated: true, completion: nil)
  }
}
