//
//  TweetDataModel.swift
//  Twitter
//
//  Created by 和田康一 on 2024/05/04.
//

import RealmSwift

// データモデル
class tweetDataModel: Object {
    // 管理用 ID。プライマリーキー
    @Persisted var id: String = UUID().uuidString //データを一意に識別するための識別子
    // ツイート本文
    @Persisted var tweetData: String = ""
    // ユーザー名
    @Persisted var userName: String = ""
    // ユーザーアイコン
    @Persisted var image: Data
    
}
