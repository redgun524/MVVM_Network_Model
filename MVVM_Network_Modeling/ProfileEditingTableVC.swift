//
//  ProfileEditingTableVC.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 1..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

class ProfileEditingTableVC: BaseTableVC {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
}

extension ProfileEditingTableVC {
    
    func initViews() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        tableView.tableHeaderView = headerView
        
        let stackView = UIStackView().then {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .center
        }
        headerView.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.top.equalTo(headerView).offset(20)
            $0.centerX.equalTo(headerView)
        }
        let txt1 = UILabel().then {
            $0.text = "123123"
        }
        
        let txt2 = UILabel().then {
            $0.text = "555555"
        }
        
        stackView.addArrangedSubview(txt1)
        stackView.addArrangedSubview(txt2)
    }
}

extension ProfileEditingTableVC {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return 4
        default:
            return 0
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var title = ""
        let index = (indexPath.section, indexPath.row)
        let cell = UITableViewCell(style: .default, reuseIdentifier: "ProfileEditingCell")
        
        switch index {
        case (0 ,0):
            title = "Row1"
        case (0 ,1):
            title = "Row2"
        case (1 ,0):
            title = "Row1"
        case (1 ,1):
            title = "Row2"
        case (1 ,2):
            title = "Row3"
        case (1 ,3):
            title = "Row4"
        default:
            break
        }
        cell.textLabel?.text = title
        cell.accessoryType = .disclosureIndicator
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return section == 0 ? "Section1" : "Section2"
    }
}
