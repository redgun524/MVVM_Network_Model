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
    
    var rcHour: RadioButtonsController!
    var rcType: RadioButtonsController!
    
    var topPriceViewModel: PriceViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topPriceViewModel = PriceViewModel(request: RequestVO(hour: 1, rank: .C))
        initViews()
    }
}

extension HomeVC {
    
    func initViews() {
        view.backgroundColor = .white
        
        let txtTitle = BaseLabel().then { $0.text = "매칭화면 뿜뿜" }
        editID = BorderedTextField().then { $0.placeholder = "아이디" }
        editPassword = BorderedTextField().then { $0.placeholder = "비밀번호" }
        
        let topPriceView = TopPriceView(viewModel: topPriceViewModel)
        
        view.addSubview(topPriceView)
        view.addSubview(txtTitle)
        view.addSubview(editID)
        view.addSubview(editPassword)
        
        topPriceView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        editID.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalTo(view)
        }
        
        txtTitle.snp.makeConstraints {
            $0.bottom.equalTo(editID.snp.top).offset(-8)
            $0.leading.equalTo(editID).offset(5)
        }
        
        editPassword.snp.makeConstraints {
            $0.top.equalTo(editID.snp.bottom).offset(8)
            $0.leading.equalTo(editID)
            $0.trailing.equalTo(editID)
        }
        
        initRadioButtons()
    }
    
    func initRadioButtons() {
        
        let stackHour = UIStackView().then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("1시간", for: .normal) })
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("2시간", for: .normal) })
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("3시간", for: .normal) })
        }
        
        let stackType = UIStackView().then {
            $0.axis = .horizontal
            $0.distribution = .fillEqually
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("씨앗", for: .normal) })
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("새싹", for: .normal) })
            $0.addArrangedSubview(RadioButton().then { $0.setTitle("나무", for: .normal) })
        }
        
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.addArrangedSubview(stackHour)
            $0.addArrangedSubview(stackType)
        }
        
        view.addSubview(stackView)
        
        stackView.snp.makeConstraints {
            $0.leading.equalTo(editID)
            $0.trailing.equalTo(editID)
            $0.top.equalTo(editPassword.snp.bottom).offset(40)
        }
        
        rcHour = RadioButtonsController().then {$0.delegate = self}
        rcType = RadioButtonsController().then {$0.delegate = self}
        
        for btn in stackHour.arrangedSubviews {
            rcHour.addButton(btn as! RadioButton)
        }
        
        for btn in stackType.arrangedSubviews {
            rcType.addButton(btn as! RadioButton)
        }
        
        rcHour.selectRadioBtn(index: 0)
        rcType.selectRadioBtn(index: 0)
        
    }
}

extension HomeVC: RadioButtonControllerDelegate {
    
    func didSelectButton(_ aButton: RadioButton?) {
        topPriceViewModel.setByIndex(hourIndex: rcHour.selectedRow, typeIndex: rcType.selectedRow)
    }
}
