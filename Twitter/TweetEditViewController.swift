//
//  TweetEditViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/03/24.
//

import UIKit

/// ツイート編集画面
class TweetEditViewController: UIViewController {
    
    // Properties
    private let placeholderText = "いまどうしてる？"
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userIconImageView: UIImageView!
    @IBOutlet weak var postContentTextView: UITextView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // プレースホルダー用の関数を呼び出し
        configureTextView()
    }
    
    // MARK: - IBActions
    
    ///　ポストボタン タップイベント
    @IBAction func didTapPostButton(_ sender: Any) {
    }
    
    /// キャンセルボタン タップイベント
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    /// 編集ボタン タップイベント
    @IBAction func didTapIconEditButton(_ sender: Any) {
        let nextVC = IconEditViewController()
        present(nextVC, animated: true)
    }
    
    // MARK: - Other Methods
    
    /// プレースホルダーの設定をしている
    private func configureTextView() {
        postContentTextView.text = placeholderText
        //プレースホルダーテキストの色を設定
        postContentTextView.textColor = UIColor.lightGray
        
        // delegateを設定
        postContentTextView.delegate = self
    }
}

// MARK: - UITextViewDelegate

extension TweetEditViewController: UITextViewDelegate {
    /// テキストが編集されたときに呼ばれる
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText && textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    /// テキストフィールドがフォーカスを失ったときに呼ばれる
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = UIColor.lightGray
        }
    }
}
