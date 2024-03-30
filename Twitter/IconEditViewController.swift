//
//  IconEditViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/03/30.
//

import UIKit

/// アイコン編集画面
class IconEditViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var userIconImageEditView: UIImageView!
    @IBOutlet weak var iconEditLabel: UILabel!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - IBActions
    
    /// 写真選択ボタン タップイベント
    @IBAction func didTapPhotoSelectButton(_ sender: Any) {
    }
}
