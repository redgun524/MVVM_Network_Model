//
//  StatusLabelViewModel.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class StatusLabelViewModel: LabelPresentable {
    
    var status: MatchingStatus
    
    init(_ matching: MatchingVO) {
        self.status = matching.status ?? .waiting
    }
    
    var text: String {
        return status.asString
    }
    
    var style: CustomTextStyle {
        return .description
    }
    
    var attributedString: NSAttributedString? {
        return nil
    }
    
    func setBorder(view: UIView) {
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
    }
}
