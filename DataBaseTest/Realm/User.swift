//
//  User.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import Foundation
import RealmSwift

enum UserType: Int {
    case premium
    case gold
    case none
}

class User: Object {
    @objc dynamic var userId = 0
    @objc dynamic var firstName = ""
    @objc dynamic var passport: Passport?
    @objc private dynamic var privateUserType: Int = UserType.none.rawValue
    let isEmailSubscriptionEnable = RealmOptional<Bool>()
    let todos = List<Todo>()
    
    
    var isUserHasTodos: Bool {
        return todos.count > 0
    }
    
    var type: UserType {
        get { return UserType(rawValue: privateUserType) ?? .none }
        set { privateUserType = newValue.rawValue }
    }
    
    override class func indexedProperties() -> [String] {
        return ["userId", "firstName"]
    }
    
    override class func primaryKey() -> String? {
        return "userId"
    }
    
    convenience init(_ firstName: String, _ userId: Int) {
        self.init()
        self.firstName = firstName
        self.userId = userId
    }
    
}

//MARK: - CRUD methods
extension User {
    static func getAll(in realm: Realm = try! Realm()) -> Results<User>? {
        return realm.objects(User.self)
    }
    
    static func getUsersBy(condition: String, in realm: Realm = try! Realm()) -> Results<User>? {
        return realm.objects(User.self).filter(condition)
    }
    
    static func getUser(userId: Int, in realm: Realm = try! Realm()) -> User? {
        return realm.object(ofType: User.self, forPrimaryKey: userId)
    }
    
    
    static func add(user: User, in realm: Realm = try! Realm()) {
        try! realm.write{
            realm.add(user)
        }
    }
    
    static func update(user: User, in realm: Realm = try! Realm()) {
        try! realm.write {
            realm.add(user, update: .modified)
        }
    }
    
    static func deleteWith(condition: String, in realm: Realm = try! Realm()) {
        try! realm.write {
            realm.delete(realm.objects(User.self).filter(condition))
        }
    }
    
    static func deleteAll(in realm: Realm = try! Realm()) {
        try! realm.write {
            realm.deleteAll()
        }
    }
}
