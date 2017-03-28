//
//  Utility.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/29/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation

class Utility: NSObject
{
    class var sharedInstance: Utility {
        struct Static {
            static let instance: Utility = Utility()
        }
        return Static.instance
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
