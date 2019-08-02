//
//  ImagePicker.swift
//  Desafio
//
//  Created by Den Mont on 02/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import UIKit

protocol ImagePickerPhotoSelected {
    func imagePickerPhotoSelected(_ photo: UIImage)
}

enum MenuOpcoes {
    case camera
    case biblioteca
}

class ImagePicker: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var delegate: ImagePickerPhotoSelected?
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let photo = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        delegate?.imagePickerPhotoSelected(photo)
            
        picker.dismiss(animated: true, completion: nil)
    }
    
    func menuDeOpcoes(complition:@escaping(_ opcao: MenuOpcoes) -> Void) -> UIAlertController {
        let menu = UIAlertController(title: "Atenção", message: "escolha uma opção", preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "tirar foto", style: .default) { (acao) in
            complition(.camera)
        }
        menu.addAction(camera)
            
        let biblioteca = UIAlertAction(title: "biblioteca", style: .default) { (acao) in
            complition(.biblioteca)
        }
        menu.addAction(biblioteca)
            
        let cancel = UIAlertAction(title: "cancelar", style: .cancel, handler: nil)
        menu.addAction(cancel)
            
        return menu
            
    }

}
