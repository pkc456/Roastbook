//
//  MirrorBusinessLayer.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/25/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class MirrorBusinessLayer: NSObject {
  class var sharedInstance: MirrorBusinessLayer {
    struct Static {
      static let instance: MirrorBusinessLayer = MirrorBusinessLayer()
    }
    return Static.instance
  }
  
  func parseArrayJsonData(data: NSArray) -> [MirrorModel] {
    let modelObject = MirrorModel.modelsFromDictionaryArray(array: data)
    return modelObject
  }
  
  //Methods to get dummy data
  func getMirrorModelInformationDataArray() -> [MirrorModel] {
    let MirrorModelDictionary = getMirrorModelListData()
    
    let arrayOfMirrorData = MirrorModel.modelsFromDictionaryArray(array: [MirrorModelDictionary])
    return arrayOfMirrorData
  }
  
  private func getMirrorModelListData() -> NSMutableDictionary{
    let data : NSMutableDictionary = NSMutableDictionary()
    data.setValue("Aamir khan", forKey: KKEY_MIRROR_CELEBRITY_NAME)
    data.setValue("70", forKey: KKEY_MIRROR_HATE_PERCENTAGE)
    
    return data
  }
}
