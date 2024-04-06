//
//  IconEditViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/03/30.
//

import UIKit

protocol IconEditViewControllerDelegate: AnyObject {
    func update(userIconImageView: UIImage)
}

/// アイコン編集画面
class IconEditViewController: UIViewController {
    
    weak var delegate: IconEditViewControllerDelegate?
    
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
        
        // カメラを起動
        let alert: UIAlertController = UIAlertController(title: "プロフィールを設定", message: "どちらか選択してください。", preferredStyle:  UIAlertController.Style.actionSheet)
        
        // カメラを起動するアラート
        let cameraAction: UIAlertAction = UIAlertAction(title: "カメラを起動", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            // UIImagePickerController カメラを起動する
            self.present(picker, animated: true, completion: nil)
            
            print("カメラを起動")
        })
        
        // フォトライブラリを起動するコード
        let photoAction: UIAlertAction = UIAlertAction(title: "フォトライブラリを起動", style: UIAlertAction.Style.default, handler:{
            (action: UIAlertAction!) -> Void in
            
            let picker = UIImagePickerController()
            self.present(picker, animated: true)
            
            // 画像選択時のデリゲートを設定
            picker.delegate = self
            print("フォトライブラリを起動")
        })
        
        // アクションを追加
        alert.addAction(cameraAction)
        alert.addAction(photoAction)
        
        // アラートを表示
        present(alert, animated: true, completion: nil)
    }
    
    /// 閉じるボタン タップイベント
    @IBAction func didTapExitButton(_ sender: Any) {
        // imageViewに画像を表示
        delegate?.update(userIconImageView: userIconImageEditView.image!)
        print ("確認")
        // ツイート編集画面へ遷移する。
        dismiss(animated: true, completion: nil)
    }
}

extension IconEditViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // フォトライブラリ起動後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as! UIImage
        // imageViewに画像を表示
        self.userIconImageEditView.image = image
        // UIImagePickerController カメラが閉じる
        self.dismiss(animated: true, completion: nil)
    }
    
    // カメラ呼び出し後の処理
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        // 画像選択時の処理
        // ↓選んだ画像を取得
        let images = info[UIImagePickerController.InfoKey.originalImage.rawValue] as? UIImage
        // imageViewに画像を表示
        self.userIconImageEditView.image = images
        delegate?.update(userIconImageView: images!)
        print("画像を出力２")
        // カメラロールを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // キャンセルボタンを押下時の処理
        // カメラロールを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
}

