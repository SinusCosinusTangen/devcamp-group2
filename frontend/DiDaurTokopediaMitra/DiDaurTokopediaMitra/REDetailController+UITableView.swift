//
//  REDetailView+UITableView.swift
//  DiDaurTokopediaMitra
//
//  Created by Daffashiddiq on 16/10/22.
//
import UIKit

extension REDetailController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let resultDomain = self.resultDomain else { return UITableViewCell() }
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: InProgressCell.identifier, for: indexPath) as? InProgressCell else { return UITableViewCell() }
            cell.setResult(result: resultDomain)
            return cell
        default:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailCell.identifier, for: indexPath) as? DetailCell else { return UITableViewCell() }
            cell.delegate = self
            return cell
        }
    }
    
    
}

extension REDetailController: DetailCellDelegate {
    func didClickDoneButton(weight: Int) {
        self.viewModel.didClickDoneButton(weight: weight)
    }
}
