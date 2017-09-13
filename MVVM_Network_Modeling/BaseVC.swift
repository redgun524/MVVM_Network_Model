//
//  BaseVC.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 1..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, SimpleAlertProtocol, ErrorHandling {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    func showError(code: ErrorCode) {
        simpleAlert(vc: self, title: "네트워크 에러", message: code.description)
    }
}

class BaseTableVC: UITableViewController, SimpleAlertProtocol, ErrorHandling {
    
    func showError(code: ErrorCode) {
        simpleAlert(vc: self, title: "네트워크 에러", message: code.description)
    }
}
