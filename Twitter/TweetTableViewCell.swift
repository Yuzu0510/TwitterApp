//
//  TweetTableViewCell.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/29.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - View Life-Cycle Methods
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // ユーザーアイコンの角丸処理(円形処理)
        self.userIconImageView.layer.cornerRadius = 15
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
