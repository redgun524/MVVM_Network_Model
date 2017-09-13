//
//  MatchingCell.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class MatchingCell: UITableViewCell {
    
    lazy var imgStatus = UIImageView()
    lazy var txtName = UILabel()
    lazy var txtStatus = UILabel()
    
    var matching: MatchingVO!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(imgStatus)
        contentView.addSubview(txtName)
        contentView.addSubview(txtStatus)
        
        imgStatus.snp.makeConstraints {(make) in
            make.left.equalTo(8)
            make.centerY.equalTo(contentView)
        }
        
        txtName.snp.makeConstraints{ (make) in
            make.leading.equalTo(imgStatus.snp.trailing).offset(8)
            make.bottom.equalTo(imgStatus.snp.centerY).offset(5)
        }
        
        txtStatus.snp.makeConstraints{ (make) in
            make.leading.equalTo(txtName)
            make.top.equalTo(txtName.snp.bottom).offset(5)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(_ matching: MatchingVO) {
        self.matching = matching
        txtName.text = matching.partnerName
        configureImageStatus()
        configureTextStatus()
    }
    
    func configureImageStatus() {
        let viewModel = StatusImageViewModel(matching)
        imgStatus.configure(viewModel)
    }
    
    func configureTextStatus() {
        let viewModel = StatusLabelViewModel(matching)
        txtStatus.configure(viewModel)
    }
}
