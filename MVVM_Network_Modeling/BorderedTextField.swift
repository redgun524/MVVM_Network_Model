//
//  BorderedTextField.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 8. 28..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

enum TextFieldBorderStyle {
    case gray
}

class BorderedTextField: BaseTextField {
    
    var inset = UIEdgeInsetsMake(5, 8, 5, 8)
    
    init(inset: UIEdgeInsets? = nil, style: TextFieldStyle = .base, borderStyle: TextFieldBorderStyle = .gray) {
        super.init(style: style)
        if inset != nil {
            self.inset = inset!
        }
        setBorder(style: borderStyle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, inset)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, inset)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, inset)
    }
    
    func setBorder(style: TextFieldBorderStyle) {
        switch style {
        case .gray:
            layer.borderWidth = 1
            layer.borderColor = UIColor.darkGray.cgColor
        }
    }
}

