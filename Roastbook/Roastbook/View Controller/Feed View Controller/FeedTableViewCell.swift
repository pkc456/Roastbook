//
//  FeedTableViewCell.swift
//  Roastbook
//
//  Created by Pradeep Choudhary on 4/8/17.
//  Copyright © 2017 Pardeep chaudhary. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelMusicName: UILabel!
    @IBOutlet weak var labelArtistName: UILabel!
    @IBOutlet weak var imageViewCover: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func configureCellWithData(musicInformationModelObject : Feed)
    {
//        labelMusicName.text = musicInformationModelObject.song
//        labelArtistName.text = musicInformationModelObject.artists
//        
//        let url: NSURL = NSURL(string: musicInformationModelObject.cover_image!)!
//        imageViewCover.af_setImage(withURL: url as URL)
    }
    
}
