//
//  HomeViewController.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, ImagePickerPhotoSelected {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imgUser: UIImageView!
    
    
    // MARK: - Variaveis
    
    var email: String?
    let imagePicker = ImagePicker()

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(email)")
        imagePicker.delegate = self
        
        setupImage()
        
    }

    // MARK: - Actions
    
    @IBAction func buttonLogout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let navigation = storyboard.instantiateViewController(withIdentifier: "navigation-login") as! UINavigationController
        UIApplication.shared.keyWindow?.rootViewController = navigation
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let menu = ImagePicker().menuDeOpcoes { (opcao) in
            self.mostrarMultimidia(opcao)
        }
        present(menu, animated: true, completion: nil)
    }
    
    // MARK: - Methods
    
    func setupImage() {
        // Arrendondar
        imgUser.layer.cornerRadius = imgUser.frame.width / 2
        imgUser.layer.masksToBounds = true
        
        // Ação do click
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgUser.isUserInteractionEnabled = true
        imgUser.addGestureRecognizer(tapGestureRecognizer)
    }
    
    
    func mostrarMultimidia(_ option: MenuOptions) {
        let multimidia = UIImagePickerController()
        multimidia.delegate = imagePicker
        
        if option == .camera && UIImagePickerController.isSourceTypeAvailable(.camera) {
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
