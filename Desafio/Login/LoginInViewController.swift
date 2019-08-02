//
//  LoginInViewController.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class LoginInViewController: UIViewController {

    // MARCK: - Outlets
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    weak var LogInDelegate: LoginInViewController?
    
    // MARCK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARCK: - Methods

    func validateFields() {
        guard let email = tfEmail.text else { return }
        guard let passoword = tfPassword.text else { return }
        
        if email.isEmpty || !Validate().email(email) {
            tfEmail.shake()
            return
        }
        
        if passoword.isEmpty || !Validate().numberMinChar(passoword) {
            tfPassword.shake()
            return
        }
        
        verifyUser(email: email, password: passoword)
    
    }
    
    func verifyUser(email: String, password: String) {
        let isLogged = User(email, password).login()
        if isLogged {
            sigIn()
        } else {
            let alert = Notification().show(title: "Ops! Algo errado.", message: "Usuário ou senha incorretos.")
            present(alert, animated: true, completion: nil)
        }
        
        
    }
    
    func sigIn() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navigation") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = navigation
    }
    
    // MARCK: - Actions

    @IBAction func buttonLogin() {
        validateFields()
    }

}

extension UITextField {
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = CGPoint(x: self.center.x - 4.0, y: self.center.y)
        animation.toValue = CGPoint(x: self.center.x + 4.0, y: self.center.y)
        layer.add(animation, forKey: "position")
    }
}
