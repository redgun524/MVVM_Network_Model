//
//  BaseTextField.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 13..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

enum TextFieldStyle {
    case base
}

class BaseTextField: UITextField {
    
    init(style: TextFieldStyle = .base) {
        super.init(frame: CGRect.zero)
        setStyle(style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func unableAutoCheck() {
        autocapitalizationType = .none
        autocorrectionType = .no
        spellCheckingType = .no
    }
    
    func setStyle(_ style: TextFieldStyle) {
        switch style {
        case .base:
            textColor = UIColor.black
            font = UIFont.systemFont(ofSize: 14)
            backgroundColor = UIColor(hex: 0xeeeeee, alpha: 0.4)
        }
    }
}
