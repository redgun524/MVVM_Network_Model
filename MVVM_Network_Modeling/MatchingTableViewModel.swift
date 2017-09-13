//
//  MatchingTableViewModel.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class MatchingTableViewModel: NSObject {
    
    fileprivate lazy var modelList = [MatchingCellViewModel]()
    
    func getMatchingList(id: Int, errorHandling: ErrorHandling, completion: (() -> ())? = nil) {
        
        ApiManager.matching.fetchMatchingList(id: id, errorHandling: errorHandling) { matchingList in
            self.modelList = matchingList.map {
                return MatchingCellViewModel(matching: $0)
            }
            completion?()
        }
    }
}

extension MatchingTableViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cvm = modelList[indexPath.row]
        return cvm.cellInstance(tableView, indexPath: indexPath)
    }
}
