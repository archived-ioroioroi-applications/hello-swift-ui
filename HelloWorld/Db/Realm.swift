//
//  Realm.swift
//  HelloWorld
//
//  Created by 五百蔵和也 on 2021/05/27.
//

import RealmSwift

// Define your models like regular Swift classes
class Dog: Object {
    @objc dynamic var name = ""
    @objc dynamic var age = 0
}
class Person: Object {
    @objc dynamic var name = ""
    @objc dynamic var picture: Data? = nil // optionals supported
    let dogs = List<Dog>()
}
