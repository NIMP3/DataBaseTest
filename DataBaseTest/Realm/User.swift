//
//  User.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import Foundation
import RealmSwift

class User: Object {
    @objc dynamic var name = ""
    var cards = List<Card>()
    
    static func create(withName name: String, cards: [Card]) -> User {
        let user = User()
        
        user.name = name
        user.cards.append(objectsIn: cards)
        
        return user
    }
}
