//
//  MatchingTableViewModel.swift
//  MVVM-Network-Modeling
//
//  Created by  Pumpapapumpa on 2017. 8. 22..
//  Copyright © 2017년 Pumpa. All rights reserved.
//

import UIKit

class MatchingTableViewModel: NSObject {
    
    fileprivate lazy var matchingList = [MatchingVO]()
    
    func getMatchingList(id: Int, errorHandling: ErrorHandling, completion: (() -> ())? = nil) {
        
        ApiManager.matching.fetchMatchingList(id: id, errorHandling: errorHandling) { matchingList in
            self.matchingList = matchingList
            completion?()
        }
    }
}

extension MatchingTableViewModel: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matchingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = matchingList[indexPath.row]
        let cell = tableView.dequeueReusableCell(MatchingCell.self)
        cell.configure(item)
        return cell
    }
}
