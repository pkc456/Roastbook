//
//  UserDetail.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 3/29/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation

class UserDetail: NSObject, NSCoding
{    
    var name: String = ""

    init(restDic : NSDictionary)
    {
        self.name = restDic[KKEY_USER_NAME] as? String ?? ""
    }
    
     required init(coder aDecoder: NSCoder) {
        self.name =  aDecoder.decodeObject(forKey: KKEY_USER_NAME) as! String
    }
    
    func encode(with aCoder: NSCoder){
        aCoder.encode(name, forKey: KKEY_USER_NAME)
    }
    
}
