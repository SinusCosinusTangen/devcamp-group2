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
        return self.listItem.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InProgressCell.identifier, for: indexPath) as? InProgressCell else { return UITableViewCell() }
        cell.setResult(result: self.listItem[row])
        return cell
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        self.viewModel.didSelected(result: self.listItem[row])
    }
    
}
