//
//  D1v1bApiModel.swift
//  HelloWorld
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI

struct D1v1bApiModelImg: Hashable, Codable {
    var large: String?
    var medium: String?
    var small: String?
}

struct D1v1bApiModel: Hashable, Codable {
    let id: Int
    let name: String
    let summary: String
    let image: D1v1bApiModelImg
}
