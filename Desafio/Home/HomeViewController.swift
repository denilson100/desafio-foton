//
//  HomeViewController.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ImagePickerPhotoSelected {
    
    @IBOutlet weak var imgUser: UIImageView!
    
    
    // MARK: - Variaveis
    
    var email: String?
    let imagePicker = ImagePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(email)")
        imagePicker.delegate = self
        
    }

    // MARK: - Actions
    
    @IBAction func buttonLogout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navigation-login") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = navigation
    }
    
    @IBAction func buttonGetPhoto(_ sender: UIButton) {
        let menu = ImagePicker().menuDeOpcoes { (opcao) in
            self.mostrarMultimidia(opcao)
        }
        present(menu, animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    func mostrarMultimidia(_ opcao: MenuOpcoes) {
        
        let multimidia = UIImagePickerController()
        multimidia.delegate = imagePicker
        
        if opcao == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
            multimidia.sourceType = .camera
        } else {
            multimidia.sourceType = .photoLibrary
        }
        self.present(multimidia, animated: true, completion: nil)

    }
    
    // MARK: - Delegates
    
    func imagePickerPhotoSelected(_ photo: UIImage) {
        imgUser.image = photo
    }
}
