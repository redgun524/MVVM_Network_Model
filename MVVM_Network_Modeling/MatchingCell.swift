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
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initContentViews()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var matching: MatchingVO? {
        didSet {
            txtName.text = matching?.partnerName
            imgStatus.image = matching?.status?.image
            txtStatus.text = matching?.status?.string
        }
    }
    
    func configure(_ matching: MatchingVO) {
        self.matching = matching
        
    }
}

extension MatchingCell {
    
    func initContentViews() {
        contentView.addSubview(imgStatus)
        contentView.addSubview(txtName)
        contentView.addSubview(txtStatus)
        
        imgStatus.snp.makeConstraints {
            $0.left.equalTo(8)
            $0.centerY.equalTo(contentView)
        }
        
        txtName.snp.makeConstraints{
            $0.leading.equalTo(imgStatus.snp.trailing).offset(8)
            $0.bottom.equalTo(imgStatus.snp.centerY).offset(5)
        }
        
        txtStatus.snp.makeConstraints{
            $0.leading.equalTo(txtName)
            $0.top.equalTo(txtName.snp.bottom).offset(5)
        }
    }
}
