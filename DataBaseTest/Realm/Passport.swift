//
//  Passport.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 16/03/21.
//

import Foundation
import RealmSwift

class Passport: Object {
    @objc dynamic var passportNumber = ""
    @objc dynamic var expiryDate = Date.distantFuture
    
    let ofUser = LinkingObjects(fromType: User.self, property: "passport")
    
    convenience init(_ passportNumber: String) {
        self.init()
        self.passportNumber = passportNumber
    }
}
