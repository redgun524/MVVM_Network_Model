//
//  MatchingVO.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import SwiftyJSON

class MatchingVO {
    
    init(json: JSON) {
        partnerName = json["name"].string
        status = MatchingStatus(rawValue: json["status"].intValue)
    }
    
    init(partnerName: String?, status: MatchingStatus) {
        self.partnerName = partnerName
        self.status = status
    }
    
    var partnerName: String?
    var userType: UserType?
    var status: MatchingStatus?
}

enum UserType: Int {
    case sitter = 0
    case parent = 1
    
    var asString: String {
        switch self {
        case .sitter:
            return "선생님"
        case .parent:
            return "고객님"
        }
    }
}

enum MatchingStatus: Int {
    case waiting = 100
    case money = 200
    case matching = 300
    case end = 400
    
    var asString: String {
        switch self {
        case .waiting:
            return "입금 확인 중"
        case .money:
            return "입금 필요"
        case .matching:
            return "매칭 완료"
        case .end:
            return "매칭 종료"
        }
    }
}
