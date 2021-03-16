//
//  Card.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import Foundation
import RealmSwift

class Todo: Object {
    @objc dynamic var name = ""
    @objc dynamic var details = ""
    
    let ofUser = LinkingObjects(fromType: User.self, property: "todos")
    
    convenience init(_ name: String, _ details: String) {
        self.init()
        self.name = name
        self.details = details
    }
}
