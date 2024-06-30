//
//  ViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/18.
//

import UIKit
import RealmSwift

/// タイムライン画面
class TimelineViewController: UIViewController {
    
    var tweetData: [tweetDataModel] = []
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    // MARK: - View Life-Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreTableView()
    }
    
    // MARK: - IBActions
    
    /// ツイートボタン タップイベント
    @IBAction func didTapTweetButton(_ sender: Any) {
        // ツイート編集画面へ遷移する。
        let nextVC = TweetEditViewController()
        nextVC.modalPresentationStyle = .fullScreen
        present(nextVC, animated: true)
    }
    
    // MARK: Other Methods
    
    private func configreTableView() {
        tweetTableView.dataSource = self
        tweetTableView.delegate = self
        // 下記のコードでUINibの登録をしている。
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tweetTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}

// MARK: - UITableViewDataSource

extension TimelineViewController: UITableViewDataSource {
    /// リストの数を指定する。　passlistの配列の個数＝tableViewのリストの個数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tweetData.count
    }
    
    /// リストの中身を出力する。
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! TweetTableViewCell
        // stringListDataの中身を表示する（detailLabelを指定することで、TweetTableViewで定めたフォーマットと紐付く。）
        cell.userIconImageView?.image = tweetData[indexPath.row]
        cell.detailLabel?.text = tweetData[indexPath.row]
        cell.nameLabel?.text = tweetData[indexPath.row]
        return cell
    }
    
    /// セルの高さを設定する。
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // セルの高さを自動調整する。
        return UITableView.automaticDimension
    }
}

// MARK: - UITableViewDelegate

extension TimelineViewController: UITableViewDelegate, TweetEditViewControllerDelegate {
    
    // MARK: Other Methods
    /// タイムライン画面上のユーザーアイコンを変更する。
    func timeLineUpdate() {
        do {
            let realm = try Realm()
            let result = realm.objects(tweetDataModel.self)
            tweetData = Array(result) // ← 取得したもの（result）を配列に格納
            tweetTableView.reloadData()
            print("データを取得しました。")
        } catch {
            // 取得失敗時の処理
            print("データの取得エラー: \(error)")
            showAlert()
        }
    }
    
    /// アラートを表示
        private func showAlert() {
            let alert = UIAlertController(title: "エラーが発生しました",
                                          message: "",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
}
