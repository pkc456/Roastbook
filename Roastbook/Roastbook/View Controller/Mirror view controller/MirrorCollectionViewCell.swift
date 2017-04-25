//
//  MirrorCollectionViewCell.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/25/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class MirrorCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelCelebrityName: UILabel!
    @IBOutlet weak var labelHatePercentage: UILabel!
    
    var mirrorModel: MirrorModel? {
        didSet {
            if let modelObject = mirrorModel {
                labelCelebrityName.text = modelObject.celebrityName
                labelHatePercentage.text = modelObject.hatePercentage! + " %"
//                imageView.image = modelObject.image
                
            }
        }
    }        
    
}
