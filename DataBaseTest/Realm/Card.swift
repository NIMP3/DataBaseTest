//
//  Card.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import Foundation
import RealmSwift

class Card: Object {
    @objc dynamic var role = ""
    
    static func create(withRole role: String) -> Card {
        let card = Card()
        card.role = role
        return card 
    }
}
