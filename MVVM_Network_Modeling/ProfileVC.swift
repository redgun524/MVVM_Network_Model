//
//  ProfileVC.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    
    lazy var txtTest = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(txtTest)
        txtTest.text = "프로필화면 뿜뿜"
        txtTest.snp.makeConstraints{ (make) in
            make.center.equalTo(self.view)
        }
    }
}

extension ProfileVC {
    
    func initViews() {
    }
}
