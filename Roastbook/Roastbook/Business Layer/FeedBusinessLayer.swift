//
//  FeedBusinessLayer.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/8/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation

class FeedBusinessLayer: NSObject
{
    class var sharedInstance: FeedBusinessLayer {
        struct Static {
            static let instance: FeedBusinessLayer = FeedBusinessLayer()
        }
        return Static.instance
    }
    
    func parseArrayJsonData(data: NSArray) -> [Feed] {
        let modelObject = Feed.modelsFromDictionaryArray(array: data)
        return modelObject
    }
    
    //Methods to get dummy data
    func getFeedInformationDataArray() -> [Feed] {
        let feedDictionary = getFeedListData()
        
        let arrayOfMusicData = Feed.modelsFromDictionaryArray(array: [feedDictionary])
        return arrayOfMusicData
    }
    
    private func getFeedListData() -> NSMutableDictionary{
        let data : NSMutableDictionary = NSMutableDictionary()
        data.setValue("I am rockstar. I am rockstar. I am rockstar What are your views. I am waiting. Slide across the down button. Show me! Can you I am rockstar. I am rockstar. I am rockstar What are your views. I am waiting. Slide across the down button. Show me! Can you. Testing", forKey: KKEY_FEED)
        data.setValue("Pardeep", forKey: KKEY_FEED_NAME)
        
        return data
    }
}
