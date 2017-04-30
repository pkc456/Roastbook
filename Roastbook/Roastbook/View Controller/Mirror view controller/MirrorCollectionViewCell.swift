//
//  MirrorCollectionViewCell.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/25/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit
import AlamofireImage

class MirrorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelCelebrityName: UILabel!
    @IBOutlet weak var labelHatePercentage: UILabel!
  
    var mirrorModel: MirrorContentItem? {
        didSet {
            if let modelObject = mirrorModel {
                labelCelebrityName.text = modelObject.name
                labelHatePercentage.text = String(modelObject.percentage) + " %"
              
                let url: NSURL = NSURL(string: modelObject.imagePath)!
                imageView.af_setImage(withURL: url as URL)
            }
        }
    }        
    
}
