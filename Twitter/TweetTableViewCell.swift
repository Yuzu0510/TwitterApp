//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/29.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    
}
