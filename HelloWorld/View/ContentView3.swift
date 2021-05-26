//
//  ContentView3.swift
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI

// StringにURLエンコードメソッドを付与
extension String {
    var urlEncoded: String {
        // 半角英数字 + "/?-._~" のキャラクタセットを定義
        let charset = CharacterSet.alphanumerics.union(.init(charactersIn: "/?-._~"))
        // 一度すべてのパーセントエンコードを除去(URLデコード)
        let removed = removingPercentEncoding ?? self
        // あらためてパーセントエンコードして返す
        return removed.addingPercentEncoding(withAllowedCharacters: charset) ?? removed
    }
}

class ContentView3Model: ObservableObject {
    // ViewでScrollViewとForEachを組み合わせて使うと
    // Updateされない現象が発生するので
    // 回避策として初期値に何もないデータを入れています。
    @Published var data: ITunesApiModel = ITunesApiModel(results: [ITunesApiModelResult(trackId: 0, trackName: "", artistName: "", formattedPrice: "")])

    init() {
        // 今回のapiFetchを呼び出し
        apiFetch("https://itunes.apple.com/search?term=python&country=jp&media=ebook"){ resData in
            self.data = resData
        }
    }
    func fetchBySearchWord(text: String) {
        // 今回のapiFetchを呼び出し
        apiFetch("https://itunes.apple.com/search?term=" + text.urlEncoded + "&country=jp&media=ebook"){ resData in
            self.data = resData
        }
    }
}

struct ContentView3: View {
    @ObservedObject var programVM = ContentView3Model()
    @Environment(\.presentationMode) var presentation
    @State var text: String = ""
    @State private var results = [ITunesApiModelResult]()   // 空の書籍情報配列を生成
    var body: some View {
        VStack(spacing: 10) {
            TextField("Input Search Word", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Search") {
                programVM.fetchBySearchWord(text: text)
                addSearchWord(text: text)
                presentation.wrappedValue.dismiss()
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    // 順番にProgramを処理
                     ForEach(programVM.data.results, id: \.trackId) { (program) in
                         Text(program.trackName ?? "")      // 書籍タイトル
                            .bold()
                         Text(program.artistName ?? "")     // 著者名
                            .font(.headline)
                         Text(program.formattedPrice ?? "") // 価格
                         Divider()
                     }
                }
            }
            .onAppear {
                // UserDefaultsに検索ワードがあれば初期値にセット
                if let searchWord = UserDefaults.standard.string(forKey: "SEARCH_WORD") {
                    self.text = searchWord
                }
            }
        }
    }
    func addSearchWord(text: String) {
        UserDefaults.standard.set(text, forKey: "SEARCH_WORD")
    }
}

struct ContentView3_Previews: PreviewProvider {
    static var previews: some View {
        ContentView3()
    }
}
