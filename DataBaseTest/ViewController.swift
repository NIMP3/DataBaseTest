//
//  ViewController.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    private func writeDataWithRealm() {
        let pregrado = Card.create(withRole: "Pregrado")
        let funcionario = Card.create(withRole: "Funcionario")
        let user = User.create(withName: "Edwin Yovany", cards: [pregrado, funcionario])
        
        print("Write to Realm...")
    }

}

