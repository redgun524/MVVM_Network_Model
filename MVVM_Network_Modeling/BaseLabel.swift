//
//  BaseLabel.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 13..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

enum LabelStyle {
    case base
    case mainTheme
    case description
}    
    
class BaseLabel: UILabel {
    
    init(style: LabelStyle = .base) {
        super.init(frame: CGRect.zero)
        setStyle(style)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setStyle(_ style: LabelStyle) {
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
