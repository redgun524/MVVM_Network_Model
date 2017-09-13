//
//  CustomStyle.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

enum CustomTextStyle {
    case base
    case mainTheme
    case description
}

extension UILabel {
    
    func setStyle(_ style: CustomTextStyle) {
        switch style {
        case .base:
            textColor = UIColor.black
            font = UIFont.systemFont(ofSize: 14)
        case .mainTheme:
            textColor = UIColor.main
            font = UIFont.systemFont(ofSize: 14)
        case .description:
            textColor = UIColor.black
            font = UIFont.systemFont(ofSize: 12)
        }
    }
}

enum CustomTextFieldStyle {
    case base
}

extension UITextField {
    
    func unableAutoCheck() {
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
    }
    
    func setStyle(_ style: CustomTextFieldStyle) {
        switch style {
        case .base:
            textColor = UIColor.black
            font = UIFont.systemFont(ofSize: 14)
            unableAutoCheck()
        }
    }
}
