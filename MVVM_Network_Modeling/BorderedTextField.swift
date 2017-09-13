//
//  BorderedTextField.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 8. 28..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

class BorderedTextField: UITextField {
    
    let inset = UIEdgeInsetsMake(5, 8, 5, 8)
    
    init() {
        super.init(frame: CGRect.zero)
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
}

