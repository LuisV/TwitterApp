//
//  TweetCell.swift
//  Twitter
//
//  Created by Luis Valencia on 2/18/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    @IBOutlet weak var reTweetButton: UIButton!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Iitialization code
    }
    var favorited:Bool = false
    var tweetID:Int = -1
    //var retweeted:Bool = false
    
    func setFavorite(_ isFavorited:Bool){
        favorited = isFavorited
        if(favorited){
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favorited
        if(toBeFavorited){
            TwitterAPICaller.client?.favTweet(tweetId: tweetID, success: {
                self.setFavorite(true)
            }, failure: { (Error) in
                print("Could not like \(Error)");
            })
        } else {
            TwitterAPICaller.client?.unfavTweet(tweetId: tweetID, success: {
            self.setFavorite(false)
            }, failure: { (Error) in
                 print("Could not unlike \(Error)");
            })
        }
    }
    
    @IBAction func reTweet(_ sender: Any) {
        TwitterAPICaller.client?.retweet(tweetId: tweetID, success: {
            self.setRetweeted(true)
        }, failure: { (Error) in
            print("Could not retweet \(Error)");
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setRetweeted(_ isRetweeted:Bool){
        if(isRetweeted){
            reTweetButton.setImage(UIImage(named: "retweet-icon-green"), for: UIControl.State.normal)
            reTweetButton.isEnabled = false;
        } else {
            reTweetButton.setImage(UIImage(named: "retweet-icon"), for: UIControl.State.normal)
            reTweetButton.isEnabled = true;
        }
    }
}
