//
//  HomeVC.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit
import SnapKit
import Then

final class HomeVC: UIViewController {
    
    var editID: BorderedTextField!
    var editPassword: BorderedTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()

        
        
    }
}

extension HomeVC {
    
    func initViews() {
        view.backgroundColor = .white
        
        let txtTitle = UILabel().then {
            $0.text = "매칭화면 뿜뿜"
        }
        
        editID = BorderedTextField().then {
            $0.placeholder = "아이디"
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.backgroundColor = UIColor(hex: 0xeeeeee, alpha: 0.4)
            $0.setStyle(.base)
        }
        
        editPassword = BorderedTextField().then {
            $0.placeholder = "비밀번호"
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.darkGray.cgColor
            $0.backgroundColor = UIColor(hex: 0xeeeeee, alpha: 0.4)
            $0.setStyle(.base)
        }
        
        view.addSubview(txtTitle)
        view.addSubview(editID)
        view.addSubview(editPassword)
        
        editID.snp.makeConstraints {
            $0.leading.equalTo(view.snp.leading).offset(16)
            $0.trailing.equalTo(view.snp.trailing).offset(-16)
            $0.centerY.equalTo(view)
        }
        
        txtTitle.snp.makeConstraints {
            $0.bottom.equalTo(editID.snp.top).offset(-8)
            $0.leading.equalTo(editID)
        }
        
        editPassword.snp.makeConstraints {
            $0.top.equalTo(editID.snp.bottom).offset(8)
            $0.leading.equalTo(editID)
            $0.trailing.equalTo(editID)
        }
    }
}
