//
//  Tweet.swift
//  Twitter New
//
//  Created by Harshil Maskai on 2/20/16.
//  Copyright © 2016 Harshil Maskai. All rights reserved.
//

import UIKit

class Tweet: NSObject {

    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoritesCount: Int = 0
    var user: NSDictionary
    var screenname: NSString?
    
    init(dictionary: NSDictionary){
        
        text = dictionary["text"] as? String
        
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        favoritesCount = (dictionary["favorite_count"] as? Int) ?? 0
        screenname = (dictionary["screen_name"] as? String)
        user = dictionary["user"] as! NSDictionary
        
        
        let timestampString = dictionary["created_at"] as? String
        

        
        if let timestampString = timestampString{
            let formatter = NSDateFormatter()
            formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
            timestamp = formatter.dateFromString(timestampString)
        }
        
        }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet]{
        
        var tweets = [Tweet]()
        
        for dictionary in dictionaries{
            let tweet = Tweet(dictionary: dictionary)
            
            tweets.append(tweet)
        }
        
        return tweets
    }
    
}
