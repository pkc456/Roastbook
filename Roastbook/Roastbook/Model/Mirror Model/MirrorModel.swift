//
//  MirrorModel.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/25/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class MirrorModel: NSObject {
    public var celebrityName : String?
    public var hatePercentage : String?
    
    
    public class func modelsFromDictionaryArray(array:NSArray) -> [MirrorModel]
    {
        var models:[MirrorModel] = []
        for item in array
        {
            models.append(MirrorModel(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    required public init?(dictionary: NSDictionary) {
        celebrityName = dictionary[KKEY_MIRROR_CELEBRITY_NAME] as? String
        hatePercentage = dictionary[KKEY_MIRROR_HATE_PERCENTAGE] as? String
    }
    
    public func dictionaryRepresentation() -> NSDictionary {        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.celebrityName, forKey: KKEY_MIRROR_CELEBRITY_NAME)
        dictionary.setValue(self.hatePercentage, forKey: KKEY_MIRROR_HATE_PERCENTAGE)
        
        return dictionary
    }
    

}
