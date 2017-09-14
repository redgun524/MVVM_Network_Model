//
//  RequestVO.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 14..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

enum RequestType: String {
    case A = "나무"
    case B = "새싹"
    case C = "씨앗"
    
    var price: Int {
        switch self {
        case .A:
            return 15000
        case .B:
            return 12000
        case .C:
            return 10000
        }
    }
}

struct RequestVO {
    
    var hour: Int
    var rank: RequestType
    
    var price: Int {
        return rank.price * hour
    }
    
    var name: String {
        return "\(rank.rawValue)(\(hour)시간)"
    }
}
