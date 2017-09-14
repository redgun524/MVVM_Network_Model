//
//  TopPriceView.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 14..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

class TopPriceView: UIView {
    
    private var txtRequestType: BaseLabel!
    private var txtPrice: BaseLabel!
    
    var viewModel: PriceViewModelProtocol
    
    init(viewModel: PriceViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: CGRect.zero)
        
        self.viewModel.didRequestChanged = { viewModel in
            self.txtRequestType.text = viewModel.name
            self.txtPrice.text = viewModel.price
        }
        
        txtRequestType = BaseLabel().then { $0.text = viewModel.price }
        txtPrice = BaseLabel().then { $0.text = viewModel.name }
        addSubview(txtRequestType)
        addSubview(txtPrice)
        
        self.snp.makeConstraints {
            $0.height.equalTo(40)
        }
        
        txtRequestType.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
        }
        
        txtPrice.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().offset(-16)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
