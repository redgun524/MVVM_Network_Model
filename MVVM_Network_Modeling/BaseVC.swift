//
//  BaseVC.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 1..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

class BaseVC: UIViewController, ErrorHandling {
    
    override func viewDidLoad() {
        view.backgroundColor = .white
    }
    
    //간단한 알림창 띄우기
    func simpleAlert(title: String, message msg: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: handler)
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
    }
    
    // 취소, 확인 버튼 알림창을 띄웁니다.
    func simpleAlertWithCancel(title: String, message msg: String, okButtonHandler handler: ((UIAlertAction) -> Void)?, cancelButtonHandler cancelHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: cancelHandler)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(code: ErrorCode) {
        simpleAlert(title: "네트워크 에러", message: code.description)
    }
}

class CustomTableVC: UITableViewController, ErrorHandling {
    
    //간단한 알림창 띄우기
    func simpleAlert(title: String, message msg: String, handler: ((UIAlertAction) -> Void)? = nil) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .cancel, handler: handler)
        alert.addAction(okAction)
        self.present(alert, animated: false, completion: nil)
    }
    
    // 취소, 확인 버튼 알림창을 띄웁니다.
    func simpleAlertWithCancel(title: String, message msg: String, okButtonHandler handler: ((UIAlertAction) -> Void)?, cancelButtonHandler cancelHandler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title : title, message: msg,
                                      preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "취소", style: .destructive, handler: cancelHandler)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: handler)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showError(code: ErrorCode) {
        simpleAlert(title: "네트워크 에러", message: code.description)
    }
}
