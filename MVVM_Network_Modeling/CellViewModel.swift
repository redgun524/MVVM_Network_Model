//
//  CellViewModel.swift
//  MVVM_Network_Modeling
//
//  Created by  noldam on 2017. 9. 13..
//  Copyright © 2017년 Pumpapapumpa. All rights reserved.
//

import UIKit

protocol CellViewModel {
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
