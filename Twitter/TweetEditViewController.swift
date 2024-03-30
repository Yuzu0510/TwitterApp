//
//  TweetEditViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/03/24.
//

import UIKit
/// ツイート編集画面
class TweetEditViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var postContentTextView: UITextView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    ///　ポストボタン タップイベント
    @IBAction func didTapPostButton(_ sender: Any) {
    }
    
    /// キャンセルボタン タップイベント
    @IBAction func closeButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}
