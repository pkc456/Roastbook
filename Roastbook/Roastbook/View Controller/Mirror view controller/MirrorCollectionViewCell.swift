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
  
    @IBOutlet weak var labelNewPost: UILabel!
    
    var mirrorModel: MirrorContentItem? {
        didSet {
            if let modelObject = mirrorModel {
                labelCelebrityName.text = modelObject.name
                labelHatePercentage.text = String(modelObject.percentage)
              
                let url = URL(string: modelObject.imagePath)!
                let placeholderImage = UIImage(named: "Placeholder")
                imageView.af_setImage(withURL: url, placeholderImage: placeholderImage)
              
              let randomNumber = arc4random_uniform(20) + 2
              labelNewPost.text = "\(randomNumber) new posts"
              
            }
        }
    }        
    
}
