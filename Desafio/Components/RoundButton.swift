//
//  RoundButton.swift
//  Desafio
//
//  Created by Den Mont on 01/08/19.
//  Copyright © 2019 Foton. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sharedInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        sharedInit()
    }
    
    override func prepareForInterfaceBuilder() {
        sharedInit()
    }
    
    @IBInspectable var cornerRadius: CGFloat = 15 {
        didSet {
            refreshCorners(value: cornerRadius)
        }
    }
    
    func refreshCorners(value: CGFloat) {
        layer.cornerRadius = value
    }
    
    func sharedInit() {
        refreshCorners(value: cornerRadius)
    }
}
