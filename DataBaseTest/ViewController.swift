//
//  ViewController.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 12/03/21.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {
    //MARK: - Properties
    private let realm = try! Realm()

    //MARK: - IBOutlets
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var firstRoleNameTextField: UITextField!
    @IBOutlet weak var secondRoleNameTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    //MARK: - IBActions
    
    @IBAction func insertAction() {
        insertData()
        printData()
    }
    
    @IBAction func updateAction() {
        
    }
    @IBAction func deleteAction() {
    }
    //MARK: Private methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func insertData() {
        guard let userName = userNameTextField.text else { return }
        let firstRoleName = firstRoleNameTextField.text
        let secondRoleName = secondRoleNameTextField.text
        
        if firstRoleName == nil && secondRoleName == nil { return }
        
        var cards = [Card]()
        if let first = firstRoleName { cards.append(Card.create(withRole: first))}
        if let second = secondRoleName { cards.append(Card.create(withRole: second)) }
        
        writeDataWithRealm(userName: userName, cards: cards)
    }
    
    private func printData() {
        resultLabel.text = readDataWithRealm()
    }

    private func writeDataWithRealm(userName: String, cards: [Card]) {
        let user = User.create(withName: userName, cards: cards)
        
        print("Write to Realm...")
        guard realm.isEmpty else { return }
        
        do {
            try realm.write {
                cards.forEach { card in
                    realm.add(card)
                }
                realm.add(user)
            }
        } catch {
            print("Realm error...")
        }
    }
    
    private func readDataWithRealm() -> String? {
        print("Read from Realm...")

        let data = realm.objects(User.self)
        guard let user = data.first else { return "" }
        
        var result = "User: \(user.name)"
        
        user.cards.forEach({ card in
            result.append("  Role: \(card.role)")
        })
        
        return result
    }

}

