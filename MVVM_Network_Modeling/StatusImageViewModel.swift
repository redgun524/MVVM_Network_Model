//
//  StatusImageViewModel.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class StatusImageViewModel: ImageViewPresentable {
    
    var status: MatchingStatus
    
    init(_ matching: MatchingVO) {
        status = matching.status ?? .waiting
    }
    
    var image: UIImage {
        switch status {
        case .matching:
            return #imageLiteral(resourceName: "status_matching")
        case .money:
            return #imageLiteral(resourceName: "status_money")
        case .waiting:
            return #imageLiteral(resourceName: "status_waiting")
        case .end:
            return #imageLiteral(resourceName: "status_end")
        }
    }
}
