//
//  TweetCell.swift
//  Twitter New
//
//  Created by Harshil Maskai on 2/20/16.
//  Copyright © 2016 Harshil Maskai. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profilePictureView: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var tweetTextLabel: UILabel!
    @IBOutlet weak var retweetCountLabel: UILabel!
    @IBOutlet weak var favCountLabel: UILabel!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var timestampLabel: UILabel!
    
    
    var tweet: Tweet! {
        didSet{
            tweetTextLabel.text = tweet.text as! String
            retweetCountLabel.text = String(tweet.retweetCount)
            favCountLabel.text = String(tweet.favoritesCount)
            timestampLabel.text = String(tweet.timestamp!)
            usernameLabel.text = String(tweet.user["name"]!)
            profilePictureView.setImageWithURL(tweet.user["profileUrl"]! as! NSURL)
            profileNameLabel.text = String(tweet.user["screenname"])
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
