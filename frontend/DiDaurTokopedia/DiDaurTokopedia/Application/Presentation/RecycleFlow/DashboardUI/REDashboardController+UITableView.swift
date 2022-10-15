//
//  REDashboardController+UITableView.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import UIKit

extension REDashboardController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if UserPreference.shared.isWaiting ?? false{
            return 2
        } else {
            return 1
        }
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        switch row {
        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InProgressCell.identifier, for: indexPath) as? InProgressCell else { return UITableViewCell() }
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DashboardCell.identifier, for: indexPath) as? DashboardCell else { return UITableViewCell() }
            cell.setValue(userDetail: self.userDetail)
            return cell
        }
    }
    
}
