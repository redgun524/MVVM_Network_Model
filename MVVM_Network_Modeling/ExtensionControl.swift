//
//  ExtensionControl.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

enum BorderStyle {
    case gray
}

extension UIView {
    
    func setBorder(style: BorderStyle) {
        switch style {
        case .gray:
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGray.cgColor
        }
    }
    
}
