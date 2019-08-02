//
//  Validate.swift
//  Desafio
//
//  Created by Den Mont on 02/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class Validate: NSObject {
    
    func email(_ email :String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: email)
    }
    
    func numberMinChar(_ password: String) -> Bool {
        let numberMinChar = 6
        if password.count < numberMinChar {
            return false
        }
        return true
    }

}
