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
    var stringListData = ["日本国民は、正当に選挙された国会における代表者を通じて行動し、われらとわれらの子孫のために、諸国民との協和による成果と、わが国全土にわたつて自由のもたらす恵沢を確保し、政府の行為によつて再び戦争の惨禍が起ることのないやうにすることを決意し、ここに主権が国民に存することを宣言し、この憲法を確定する。そもそも国政は、国民の厳粛な信託によるものであつて、その権威は国民に由来し、その権力は国民の代表者がこれを行使し、その福利は国民がこれを享受する。これは人類普遍の原理であり、この憲法は、かかる原理に基くものである。われらは、これに反する一切の憲法、法令及び詔勅を排除する", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK"]
    
    @IBOutlet weak var tweetTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configreTableView()
        tweetTableView.tableFooterView = UIView()
    }
    
    private func configreTableView() {
        tweetTableView.dataSource = self
        tweetTableView.delegate = self
        // 下記のコードでUINibの登録をしている。
        let nib = UINib(nibName: "TweetTableViewCell", bundle: nil)
        tweetTableView.register(nib, forCellReuseIdentifier: "Cell")
    }
}

extension TimelineViewController: UITableViewDataSource, UITableViewDelegate {
    // リストの数を指定する　passlistの配列の個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringListData.count
    }
    
    // リストの中身を出力する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)as! TweetTableViewCell
        // 文章を改行する
        cell.textLabel?.numberOfLines=0
        // stringListDataの中身を表示する
        cell.textLabel?.text = stringListData[indexPath.row]
        return cell
    }
    
    // セルの高さを設定するメソッド
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // セルの高さの推定値を設定するプロパティ（estimatedRowHeight）
        tableView.estimatedRowHeight=400
        return UITableView.automaticDimension
    }
}
