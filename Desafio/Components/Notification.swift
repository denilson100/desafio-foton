//
//  Notification.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class Notification: NSObject {

    func show(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(button)
        return alert
    }
}
