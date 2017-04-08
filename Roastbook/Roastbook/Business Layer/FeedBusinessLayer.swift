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
}
