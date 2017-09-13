//
//  MatchingCellViewModel.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 13..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

struct MatchingCellViewModel: CellViewModel {
    
    var matching: MatchingVO
    
    init(matching: MatchingVO) {
        self.matching = matching
    }
    
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(MatchingCell.self)
        cell.configure(matching)
        return cell
    }
}
