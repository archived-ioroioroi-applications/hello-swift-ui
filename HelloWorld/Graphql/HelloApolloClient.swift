//
//  ApolloClient.swift
//  HelloWorld
//  ref: <https://github.com/AmilaDiman/otrium/blob/10b7f6c01d1286bcb77643302ad6d8a0b877ee2b/Otrium/GraphQL/OTGraphQLApiManager.swift#L24>
//
//  Created by 五百蔵和也 on 2021/05/30.
//

import Apollo
import Foundation

final public class HelloApolloClient {

    //MARK:- Public variables
    
    /// Shared instance of app to access Apollo
    static let shared = HelloApolloClient()
    
    /// Apollo instance to connect to GraphQL
    private(set) lazy var apollo: ApolloClient = {
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        let client = URLSessionClient()
        let provider = LegacyInterceptorProvider(client: client, store: store)
        let url = URL(string: "http://192.168.33.250:15002/graphql")!
        
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport, store: store)
    }()
}
