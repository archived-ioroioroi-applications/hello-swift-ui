//
//  ContentView5.swift
//  https://blog.spacemarket.com/code/graphql-on-swift-by-apollo-ios/
//  TODO: Reactive UI by GraphQL はできていない. 本View は Static な画面.
//
//  Created by 五百蔵和也 on 2021/05/23.
//

import SwiftUI

/// 個々の書籍情報の型
struct QueryResult: Codable {
    var id: Int              // ID
    var name: String?        // 名前
}

struct ContentView5: View {
    @State private var results = [QueryResult]()   // 空の情報配列を生成
    
    var body: some View {
        NavigationView {
            List(results, id: \.id) { item in
                HStack(alignment: .center) {
                    Text("No." + String(item.id))
                        .font(.headline)
                    Spacer()
                    Text(item.name ?? "")
                }
            }.navigationTitle("GraphQLお試し")
        }.onAppear(perform: loadData)
    }
    func loadData() {
        let graphqlSampleQuery = HelloGraphql.PoweupsQuery()
        let graphqlClient: ProjectApolloClient = ProjectApolloClient.shared
        graphqlClient.apollo.fetch(query: graphqlSampleQuery) { result in
            guard let data = try? result.get().data else {
                // エラー時の処理
                return
            }
            // 正常に取得できた時の処理
            var _id: Int = 0
            data.allPowerups?.edges.forEach{
                results.append(QueryResult(
                                id: _id,
                                name: $0?.node?.name
                              )
                )
                _id+=1
            }
        }
    }
}
 
struct ContentView5_Previews: PreviewProvider {
    static var previews: some View {
        ContentView5()
    }
}
