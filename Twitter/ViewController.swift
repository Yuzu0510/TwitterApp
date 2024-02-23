//
//  ViewController.swift
//  Twitter
//
//  Created by 和田康一 on 2024/02/18.
//

import UIKit

class ViewController: UIViewController {
    
    // Content of each tweet.
    var stringListData = ["ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ", "ツイートA", "ツイートB", "ツイートC", "ツイートD","ツイートE", "ツイートF", "ツイートG", "ツイートH","ツイートI", "ツイートJ", "ツイートK", "ツイートL","ツイートM", "ツイートN", "ツイートO", "ツイートP","ツイートQ", "ツイートR", "ツイートS", "ツイートT","ツイートU", "ツイートV", "ツイートW", "ツイートX","ツイートY", "ツイートZ"]
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
    }
}

extension ViewController: UITableViewDataSource {
    // リストの数を指定する　passlistの配列の個数を指定
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringListData.count
    }
    
    // リストの中身を出力する
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "list", for: indexPath)
        
        cell.textLabel?.text = stringListData[indexPath.row]
        
        return cell
    }
}
