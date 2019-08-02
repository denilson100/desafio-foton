//
//  User.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class User: NSObject {
    
    // MARK: - Variaveis
    
    var email: String
    var password: String
    
    // Lista de usuários ficou estatica apenas para demostraçã
    static var users: [User] = []
    
    init(_ email: String, _ password: String) {
        self.email = email
        self.password = password
    }
    
    // MARK: - Methods
    
    func add(completion:@escaping(_ success: Bool) -> Void) {
        let lastTotalUser = User.users.count

        let user = User(self.email, self.password)
        User.users.append(user)
        let newTotalUser = User.users.count
        
        if newTotalUser > lastTotalUser {
            completion(true)
        } else {
            completion(false)
        }
        
    }
    
    func login() -> Bool {
        let user = User(self.email, self.password)
        let logged = User.users.filter({ $0.email == user.email && $0.password == user.password })
        if logged.count > 0 {
            return true
        }
        return false
    }

}
