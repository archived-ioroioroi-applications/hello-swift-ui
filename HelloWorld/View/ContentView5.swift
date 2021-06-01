//
//  ContentView5.swift
//  https://blog.spacemarket.com/code/graphql-on-swift-by-apollo-ios/
//
//  Created by 五百蔵和也 on 2021/05/23.
//

import SwiftUI

struct ContentView5: View {
    var body: some View {
        NavigationView {
            List {
            }.navigationTitle("GraphQLお試し")
        }.onAppear(perform: loadData)           // データ読み込み処理
    }
    func loadData() {
        let graphqlSampleQuery = HelloGraphql.SampleQueryQuery()
        let graphqlClient: HelloApolloClient = HelloApolloClient.shared
        graphqlClient.apollo.fetch(query: graphqlSampleQuery) { result in
            guard let data = try? result.get().data?.resultMap else {
                // エラー時の処理
                return
            }

            // 正常に取得できた時の処理
            print(data)
            // TODO: GraphQLのレスポンスをViewModelに詰めて動的にViewを動かす
        }
    }
}
 
struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
