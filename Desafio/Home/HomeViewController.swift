//
//  HomeViewController.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    var email: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(email)")
        
    }

    @IBAction func buttonLogout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navigation-login") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = navigation
    }
    
}
