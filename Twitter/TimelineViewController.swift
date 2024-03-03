//
//  ViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/18.
//

import UIKit

/// タイムライン画面
class TimelineViewController: UIViewController, UITableViewDelegate {
    
    // Content of each tweet.
    var stringListData = ["ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ"]
    
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tweetTableView.dataSource = self
        tweetTableView.tableFooterView = UIView()
        
        // 下記のコードでUINibの登録をしている。
        tweetTableView.delegate = self
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
        
        
        //let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! TweetTableViewCell
        
        cell.textLabel?.text = stringListData[indexPath.row]
        
        return cell
    }
}

