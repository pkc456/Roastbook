//
//  HomeCollectionViewCell.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/23/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import UIKit

class HomeCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageviewBackground: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var buttonNotificationCount: UIButton!
    
    
    override func awakeFromNib()
    {
//        self.contentView.layer.cornerRadius = 5.0
//        self.contentView.layer.borderColor = UIColor.lightGray.cgColor
//        self.contentView.layer.borderWidth = 1.0
        
        self.contentView.layer.shadowColor = UIColor.darkGray.cgColor
        self.contentView.layer.shadowOpacity = 0.5
        self.contentView.layer.shadowRadius = 2
        self.contentView.layer.shadowOffset = CGSize(width: 0.0, height: -3.0)
    }
    
    func setUpContent(imageName:String, title:String, notificationCount:Int){
        imageviewBackground.image = UIImage.init(named: imageName)
        labelTitle.text = title
        buttonNotificationCount.setTitle("\(notificationCount)", for: .normal)
    }
}
