//
//  MatchingVC.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class MatchingVC: CustomVC {
    
    var tableView: UITableView!
    lazy var tableViewModel = MatchingTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initViews()
        tableViewModel.getMatchingList(id: 0, errorHandling: self) {self.tableView.reloadData()}
    }
}

extension MatchingVC {
    
    func initViews() {
        let txtTitle = UILabel().then {
            $0.text = "타이틀"
        }
        
        let txtDesc = UILabel().then {
            $0.text = "이것은 설명이다 설명. 설명을 하는 텍스트란 말이다."
            $0.setStyle(.description)
        }
        
        tableView = UITableView().then {
            $0.register(MatchingCell.self)
            $0.delegate = tableViewModel
            $0.dataSource = tableViewModel
            $0.rowHeight = 70
        }
        
        view.addSubview(txtTitle)
        view.addSubview(txtDesc)
        view.addSubview(tableView)
        
        txtTitle.snp.makeConstraints{
            $0.top.equalTo(self.view).offset(40)
            $0.leading.equalTo(self.view).offset(16)
        }
        
        txtDesc.snp.makeConstraints {
            $0.top.equalTo(txtTitle.snp.bottom).offset(3)
            $0.leading.equalTo(txtTitle).offset(5)
        }
        
        tableView.snp.makeConstraints{
            $0.leading.equalTo(self.view)
            $0.trailing.equalTo(self.view)
            $0.top.equalTo(txtDesc.snp.bottom).offset(20)
            $0.bottom.equalTo(self.view)
        }
    }
}

extension MatchingVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
}
