# Hello SwiftUI

## Get Started

```sh
$ cd HelloWorld/
$ bundle install --path vendor/bundle
$ bundle exec pod init
$ bundle exec pod install
// and Run in Xcode
```

### flask-mongodb-graphene (for GraphQL)
GraphQLお試しのための超軽量GraphQlサーバ

```sh
$ cd flask-mongodb-graphene 
$ docker-compose up -d
$ docker-compose exec flask python database.py
$ docker-compose exec flask python app.py
```

* ref: <https://www.jitsejan.com/graphql-with-flask-and-mongodb>

### with apollo (for GraphQL)

```sh
$ docker-compose up -d
$ docker-compose exec node apollo schema:download --endpoint=http://192.168.33.250:15002//graphql schema.json
// and generated schema.json
$ docker-compose exec node apollo codegen:generate ./HelloWorld/Graphql/HelloGraphql.swift --target=swift --queries="./*.graphql" --localSchemaFile=schema.json --namespace=HelloGraphql
```

* Xcodeで完結させる方法もあるらしい. <https://qiita.com/kazuooooo/items/06ad397dc93ebd4ede2a>

* HTTPでなくWebSocketで繋ぐ例 : <https://github.com/Kaww/SpaceXplorer/blob/f765c949bf304748e84d08dd6b6dc5f650df45dd/SpaceXplorer/Sources/Apollo/Network.swift>

* 参考: <https://blog.spacemarket.com/code/graphql-on-swift-by-apollo-ios/> <https://www.back4app.com/docs/ios/graphql/swift-graphql>
