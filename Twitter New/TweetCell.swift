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
            
            let profileImageUrl = tweet.user["profile_image_url"] as! String
            let profileImageNSUrl = NSURL(string: profileImageUrl)
            profilePictureView.setImageWithURL(profileImageNSUrl!)
            profileNameLabel.text = String("@\(tweet.user["screen_name"]!)")
            
            print(tweet.user)
            
        }
    }
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profilePictureView.layer.cornerRadius = 5
        profilePictureView.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func onRetweetButton(sender: AnyObject) {
        print(tweet.retweetCount)
        tweet.retweetCount = tweet.retweetCount + 1
        retweetCountLabel.text = String(tweet.retweetCount)
        print("after press count\(tweet.retweetCount)")
        
        
    }
    
    @IBAction func onFavButton(sender: AnyObject) {
        tweet.favoritesCount = tweet.favoritesCount + 1
        favCountLabel.text = String(tweet.favoritesCount)
        
    }
    

}
