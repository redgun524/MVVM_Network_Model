//
//  Presentable.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

protocol TextPresentable {
    var text: String { get }
    var style: CustomTextStyle { get }
}

protocol ImagePresentable {
    var image: UIImage { get }
    var alpha: CGFloat { get }
}

@objc protocol UIViewPresentable {
    @objc optional var backgroundColor: UIColor { get }
    @objc optional func setBorder(view: UIView)
    @objc optional var frame: CGRect { get }
}

protocol LabelPresentable: TextPresentable, UIViewPresentable {
    var attributedString: NSAttributedString? { get }
}

protocol TextFieldPresentable: TextPresentable, UIViewPresentable {
    var placeholder: String { get }
    var keyboardType: UIKeyboardType { get }
    var capitalizationType: UITextAutocapitalizationType { get }
    var autoCorrectionType: UITextAutocorrectionType { get }
}

protocol ImageViewPresentable: ImagePresentable, UIViewPresentable {
    var contentMode: UIViewContentMode { get }
}

extension ImagePresentable {
    var alpha: CGFloat {
        return 1
    }
}

extension ImageViewPresentable {
    var contentMode: UIViewContentMode {
        return .scaleToFill
    }
}

extension TextFieldPresentable {
    var capitalizationType: UITextAutocapitalizationType {
        return .none
    }
    
    var autoCorrectionType: UITextAutocorrectionType {
        return .no
    }
}

extension UILabel {
    func configure(_ viewModel: LabelPresentable) {
        text = viewModel.text
        setStyle(viewModel.style)
        viewModel.setBorder?(view: self)
        if let bgColor = viewModel.backgroundColor {
            backgroundColor = bgColor
        }
        if let aString = viewModel.attributedString {
            attributedText = aString
        }
    }
}

extension UIImageView {
    func configure(_ viewModel: ImageViewPresentable) {
        image = viewModel.image
        alpha = alpha
        contentMode = viewModel.contentMode
        
    }
}
