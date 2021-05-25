//
//  ApiFetch.swift
//  HelloWorld
//
//  Created by 五百蔵和也 on 2021/05/25.
//

import SwiftUI

func apiFetch<T: Decodable>(_ url: String, completion: @escaping ([T]) -> Void) {
    guard let url = URL(string: url) else { return }

    URLSession.shared.dataTask(with: url) { (data, response, error) in
        guard let data = data else { return }
        let decoder: JSONDecoder = JSONDecoder()
        do {
            let resData = try decoder.decode([T].self, from: data)
            DispatchQueue.main.async {
                completion(resData)
            }
        } catch {
            fatalError("Couldn't load \(url) :\n\(error)")
        }
    }.resume()
}
