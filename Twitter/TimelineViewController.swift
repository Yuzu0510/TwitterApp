//
//  ViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/18.
//

import UIKit
/// タイムライン画面
class TimelineViewController: UIViewController {
    // Content of each tweet.
    var stringListData = ["ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ"]
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreTableView()
        tweetTableView.tableFooterView = UIView()
    }
    
    private func configreTableView() {
        tweetTableView.dataSource = self
        // 下記のコードでUINibの登録をしている。
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tweetTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}

extension TimelineViewController: UITableViewDataSource {
    // リストの数を指定する　passlistの配列の個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringListData.count
    }
    
    // リストの中身を出力する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! TweetTableViewCell
        
        cell.textLabel?.text = stringListData[indexPath.row]
        
        return cell
    }
}
