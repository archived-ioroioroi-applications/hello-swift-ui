//
//  ITunesApiModel.swift
//  HelloWorld
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI

/// APIから取得する戻り値の型
struct ITunesApiModel: Codable {
    var results: [ITunesApiModelResult]
}
 
/// 個々の書籍情報の型
struct ITunesApiModelResult: Codable {
    var trackId: Int                // 書籍データのID
    var trackName: String?          // 書籍タイトル
    var artistName: String?         // 著者名
    var formattedPrice: String?     // 価格（テキスト形式）
}