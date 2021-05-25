//
//  ContentView2.swift
//  https://d1v1b.com/swiftui/use_data_from_api
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI

class ContentView2Model: ObservableObject {
    // ViewでScrollViewとForEachを組み合わせて使うと
    // Updateされない現象が発生するので
    // 回避策として初期値に何もないデータを入れています。
    // 参考 -> https://stackoverflow.com/questions/59316078/swiftui-foreach-not-correctly-updating-in-scrollview
    @Published var data: [D1v1bApiModel] = [D1v1bApiModel(id: 0, name: "", summary: "", image: D1v1bApiModelImg(medium: ""))]

    init() {
        // 「モックデータを利用する」を見ていただいた方はコメントアウト
        // self.data = dataLoad("programData.json")

        // 今回のapiFetchを呼び出し
        apiFetch("https://d1v1b.com/programs.json"){ resData in
            self.data = resData
        }
    }
}

// 「モックデータを利用する」から変更はありません。
struct ContentView2: View {
    @ObservedObject var programVM = ContentView2Model()

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 10) {
                // 順番にProgramを処理
                ForEach(programVM.data, id: \.id) { (program) in
                    ZStack(alignment: .bottom) {
                        Image(program.image.medium!)
                            .resizable()
                            .scaledToFill()
                            .frame(width: UIScreen.main.bounds.width, height: 300)
                            .background(LinearGradient(gradient: Gradient(colors: [.yellow, .red, .purple]), startPoint: .bottomLeading, endPoint: .topTrailing))
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        VStack {
                            Text(program.name)
                                .font(.largeTitle)
                                .foregroundColor(.white)
                            Text(program.summary)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}
