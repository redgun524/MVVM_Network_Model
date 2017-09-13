//
//  SimpleAlertProtocol.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 13..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

protocol SimpleAlertProtocol: class {
    func simpleAlert(vc: UIViewController, title: String, message msg: String, handler: ((UIAlertAction) -> Void)?)
    func simpleAlertWithCancel(vc: UIViewController, title: String, message msg: String, okButtonHandler handler: ((UIAlertAction) -> Void)?, cancelButtonHandler cancelHandler: ((UIAlertAction) -> Void)?)
}

extension SimpleAlertProtocol {
    func simpleAlert(vc: UIViewController, title: String, message msg: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: handler)
        alert.addAction(okAction)
        vc.present(alert, animated: false, completion: nil)
    }
    
    func simpleAlertWithCancel(vc: UIViewController, title: String, message msg: String, okButtonHandler handler: ((UIAlertAction) -> Void)?, cancelButtonHandler cancelHandler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: cancelHandler)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        vc.present(alert, animated: true, completion: nil)
    }
}
