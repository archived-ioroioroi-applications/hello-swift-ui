//
//  ContentView4.swift
//  https://docs.mongodb.com/realm-legacy/docs/swift/latest/index.html
//
//  Created by 五百蔵和也 on 2021/05/27.
//

import SwiftUI
import RealmSwift

class RecordsViewModel: ObservableObject {
    private var token: NotificationToken?
    private var dogRecords = try? Realm().objects(Dog.self)
    @Published var dogs: [Dog] = []
    init() {
        token = dogRecords?.observe { [weak self] (changes: RealmCollectionChange) in
            switch changes {
            case .initial:
                self?.dogs = self?.dogRecords?.map { $0 } ?? []
            case .update(let record, deletions: let deletion, insertions: let insertion, modifications: _):
                if deletion != [] {
                    for index in deletion {
                        self?.dogs.remove(at: index)
                    }
                }
                if insertion != [] {
                    for index in insertion {
                        self?.dogs.append(record[index])
                    }
                }
            case .error(_):
                print("error")
            }
        }
    }
    deinit {
        token?.invalidate()
    }
}

struct ContentView4: View {
    @State var text: String = ""
    @ObservedObject var model = RecordsViewModel()
    var body: some View {
        VStack(spacing: 10) {
            TextField("Add Your Dog Name You Like!", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack() {
                Button("Add") {
                    addDog(text: text)
                }
                Button("Delete") {
                    deleteDog(text: text)
                }
            }
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading, spacing: 10) {
                    // 順番にProgramを処理
                     ForEach(model.dogs, id: \.name) { (puppy) in
                        Text(puppy.name)      // 書籍タイトル
                            .bold()
                        Text(String(puppy.age))     // 著者名
                            .font(.headline)
                         Divider()
                     }
                }
            }
        }
    }
    func addDog(text: String) {
        let myDog = Dog()
        myDog.name = text
        myDog.age = 1
        let realm = try! Realm()
        // Persist your data easily
        try! realm.write {
            realm.add(myDog)
        }
    }
    func deleteDog(text: String) {
        let realm = try! Realm()
        if let theDog = realm.objects(Dog.self).filter("name == %@", text).first {
            // Delete your data easily
            try! realm.write {
              realm.delete(theDog)
            }
        }
    }
}

struct ContentView4_Previews: PreviewProvider {
    static var previews: some View {
        ContentView4()
    }
}
