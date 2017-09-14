//
//  PriceViewModel.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 14..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

protocol PriceViewModelProtocol {
    var request: RequestVO { get }
    var price: String { get }
    var name: String { get }
    var didRequestChanged: ((PriceViewModelProtocol) -> ())? { get set}
    func setByIndex(hourIndex: Int, typeIndex: Int)
}

class PriceViewModel: PriceViewModelProtocol {
    
    internal var request: RequestVO
    
    init(request: RequestVO) {
        self.request = request
    }
    
    var price: String {
        return "\(request.price)원"
    }
    
    var name: String {
        return request.name
    }
    
    func setByIndex(hourIndex: Int, typeIndex: Int) {
        request.hour = (hourIndex + 1)
        switch typeIndex {
        case 0:
            request.rank = .C
        case 1:
            request.rank = .B
        case 2:
            request.rank = .A
        default:
            break
        }
        didRequestChanged?(self)
    }
    
    var didRequestChanged: ((PriceViewModelProtocol) -> ())?
}
