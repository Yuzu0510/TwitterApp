//
//  TweetEditViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/03/24.
//

import UIKit
import RealmSwift

/// delegateのプロトコル
protocol TweetEditViewControllerDelegate: AnyObject {
    func timeLineIconUpdate()
}

/// ツイート編集画面
class TweetEditViewController: UIViewController {
    
    /// delegateのプロパティ
    weak var delegate: TweetEditViewControllerDelegate?
    
    // Properties
    private let placeholderText = "いまどうしてる？"
    var dataModel = tweetDataModel()
    let realm = try! Realm()
    
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
        
        saveData()
        
        // 戻る際にdelegateを発動し、元画面のimageを更新する。
        // delegate?.timeLineIconUpdate()
        // dismiss(animated: true,completion: nil)
    }
    
    /// キャンセルボタン タップイベント
    @IBAction func didTapCloseButton(_ sender: Any) {
        dismiss(animated: true,completion: nil)
    }
    
    /// 編集ボタン タップイベント
    @IBAction func didTapIconEditButton(_ sender: Any) {
        let nextVC = IconEditViewController()
        
        // delegateは、次の画面へ移動したときに用いたボタンの中に記述する。
        nextVC.delegate = self
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
    
    /// Realmを使った保存処理を行っている
    private func saveData() {
        do {
            let realm = try Realm()
            // Realmを使って保持する
            try realm.write {
                // お気に入り動画を追加(Realm)
                // 選択された動画の情報をそれぞれの項目に代入する
                dataModel.tweetData = postContentTextView.text
                dataModel.userName = nameTextField.text!
                // RealmではUIImage型が扱えないので、pngData型に変更
                dataModel.image = userIconImageView.image!.pngData()!
                realm.add(dataModel)
                // Realmデータベースファイルまでのパスを表示
                print(Realm.Configuration.defaultConfiguration.fileURL!)
            }
            delegate?.timeLineIconUpdate()
            dismiss(animated: true,completion: nil)
        }
        catch {
            print("データを保存することができませんでした。 \(error)")
        }
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

extension TweetEditViewController: IconEditViewControllerDelegate {
    func update(userIconImageView: UIImage) {
        // IconEditViewControllerから受け取った画像を、TweetEditViewControllerへ渡す。
        self.userIconImageView.image = userIconImageView
    }
}
