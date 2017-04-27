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
  
  func parseData(data: Dictionary<String, Any>) -> (MirrorRoot) {
    let modelObject: MirrorRoot = MirrorRoot(json: data)!
    return modelObject
  }
  
}
