//
//  RealmViewController.swift
//  DataBaseTest
//
//  Created by Centro de Informática on 16/03/21.
//

import UIKit

class RealmViewController: UIViewController {

    //MARK: - Private methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //insertData()
        readData()
    }
    
    private func readData() {
        
        guard let user = User.getUser(userId: 1) else { return }
        printUser(user)
        
        guard let users = User.getAll() else { return }
        users.forEach(printUser(_:))
        print("Total: \(users.count)")
        
        //let anotherUser = User("Santiago Cruz", 3)
        //User.add(user: anotherUser)
        
        //users.forEach(printUser(_:))
        //print("Total: \(users.count)")
        
        /*let person = User("Edwin Orbes", 1)
        person.passport = user.passport
        person.todos.append(objectsIn: user.todos)
        
        User.update(user: person)*/
        
        User.deleteWith(condition: "firstName == 'Edwin Orbes'")
        
        /*guard let people = User.getUsersBy(condition: "firstName == [c] 'EDWIN YOVANY'") else { return }
        people.forEach(printUser(_:))*/
    }
    
    private func printUser(_ user: User) {
        print("===============================")
        print("Name: \(user.firstName)")
        print("Passport: \(user.passport?.passportNumber ?? "No passport Number")")
        print("Todos: \(user.isUserHasTodos ? ("Has \(user.todos.count) todos") : "No has todos")")
        
        print("-------------------------------")
        print("TODOS")
        user.todos.forEach { todo in
            print("Name: \(todo.name)")
            print("Details: \(todo.details)\n")
        }
    }
    
    private func insertData() {
        let userPassport = Passport("PASS-01")
        
        let todos: [Todo] = [
            Todo("iOS Security", "Implementar el modulo de seguridad para las aplicaciones iOS."),
            Todo("Sapiens Academic iOS", "Implementar el modulo de horarios."),
            Todo("Sapiens Academic iOS", "Implementar el modulo de calificaciones."),
            Todo("Sapiens Academic iOS", "Implementar el modulo de representante estudiantil.")
        ]
        
        let user = User("Edwin Yovany", 1)
        user.passport = userPassport
        user.isEmailSubscriptionEnable.value = nil
        user.todos.append(objectsIn: todos)
        user.type = .premium
        
        User.add(user: user)
    }

}
