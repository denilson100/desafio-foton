//
//  SignUpViewController.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfPassword: UITextField!
    
    
    // MARCK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
            
        createNewAccount()
    }
    
    func createNewAccount() {
        guard let email = tfEmail.text else { return }
        guard let password = tfPassword.text else { return }
        let user = User(email, password)
        user.add { (success) in
            if success {
                let alert = self.showAlert(title: "Parabéns!", message: "Usuário cadastrado com sucesso.")
                self.present(alert, animated: true, completion: nil)
            } else {
                let alert = Notification().show(title: "Ops!", message: "Algo inesperado ocorreu. Tente novamente.")
                self.cleanFields()
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    func cleanFields() {
        tfEmail.text = ""
        tfPassword.text = ""
        tfEmail.becomeFirstResponder()
    }
    
    // MARK: - Actions
    
    @IBAction func buttonNewUser() {
        validateFields()
    }
    
    func dismiss() {
        navigationController?.popViewController(animated: true)
    }
    
    func showAlert(title: String, message: String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss()
        }
        alert.addAction(button)
        return alert
    }
    

}
