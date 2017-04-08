//
//  Feed.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/8/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation

public class Feed {
    public var song : String?
    public var url : String?
    public var artists : String?
    public var cover_image : String?
    
    /**
     Returns an array of models based on given dictionary.
     
     Sample usage:
     let Feed_list = Feed.modelsFromDictionaryArray(someDictionaryArrayFromJSON)
     
     - parameter array:  NSArray from JSON dictionary.
     
     - returns: Array of Feed Instances.
     */
    public class func modelsFromDictionaryArray(array:NSArray) -> [Feed]
    {
        var models:[Feed] = []
        for item in array
        {
            models.append(Feed(dictionary: item as! NSDictionary)!)
        }
        return models
    }
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let Feed = Feed(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Feed Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        song = dictionary["song"] as? String
        url = dictionary["url"] as? String
        artists = dictionary["artists"] as? String
        cover_image = dictionary["cover_image"] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.song, forKey: "song")
        dictionary.setValue(self.url, forKey: "url")
        dictionary.setValue(self.artists, forKey: "artists")
        dictionary.setValue(self.cover_image, forKey: "cover_image")
        
        return dictionary
    }
    
}
