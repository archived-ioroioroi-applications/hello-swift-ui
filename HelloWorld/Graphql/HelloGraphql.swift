// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// HelloGraphql namespace
public enum HelloGraphql {
  public final class SampleQueryQuery: GraphQLQuery {
    /// The raw GraphQL definition of this operation.
    public let operationDefinition: String =
      """
      query SampleQuery {
        allPowerups {
          __typename
          edges {
            __typename
            node {
              __typename
              name
            }
          }
        }
      }
      """

    public let operationName: String = "SampleQuery"

    public init() {
    }

    public struct Data: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Query"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("allPowerups", type: .object(AllPowerup.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(allPowerups: AllPowerup? = nil) {
        self.init(unsafeResultMap: ["__typename": "Query", "allPowerups": allPowerups.flatMap { (value: AllPowerup) -> ResultMap in value.resultMap }])
      }

      public var allPowerups: AllPowerup? {
        get {
          return (resultMap["allPowerups"] as? ResultMap).flatMap { AllPowerup(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "allPowerups")
        }
      }

      public struct AllPowerup: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PowerupConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(edges: [Edge?]) {
          self.init(unsafeResultMap: ["__typename": "PowerupConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Contains the nodes in this connection.
        public var edges: [Edge?] {
          get {
            return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
          }
        }

        public struct Edge: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PowerupEdge"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("node", type: .object(Node.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(node: Node? = nil) {
            self.init(unsafeResultMap: ["__typename": "PowerupEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The item at the end of the edge
          public var node: Node? {
            get {
              return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "node")
            }
          }

          public struct Node: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Powerup"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Powerup", "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }
          }
        }
      }
    }
  }
}
