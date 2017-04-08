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
import Reactions

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelFeed: UILabel!
    @IBOutlet weak var imageViewCover: UIImageView!
    
    @IBOutlet weak var facebookReactionButton: ReactionButton!

    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    
    //MARK:- Facebook reactions
    
    private func setUI(){
    //        let myReaction = Reaction(id: "id", title: "title", color: .red, icon: UIImage(named: "second")!) //Custom reaction
    //        select.reactions =                //Array of above custom reactions
        
        facebookReactionButton.reaction = Reaction.facebook.like
        let select       = ReactionSelector()
        select.addTarget(self, action: #selector(reactionDidChanged), for: .valueChanged)
        facebookReactionButton.reactionSelector = select
    }
    
    func reactionDidChanged(_ sender: ReactionSelector) {
        print("FB reaction: \(sender.selectedReaction)")
    }
    
    
    
    //MARK:- Configure cell
    func configureCellWithData(feedInformationModelObject : Feed)
    {
        labelUserName.text = feedInformationModelObject.username
        labelFeed.text = feedInformationModelObject.feedText
        
//        let url: NSURL = NSURL(string: musicInformationModelObject.cover_image!)!
//        imageViewCover.af_setImage(withURL: url as URL)
    }
    
    
    
}
