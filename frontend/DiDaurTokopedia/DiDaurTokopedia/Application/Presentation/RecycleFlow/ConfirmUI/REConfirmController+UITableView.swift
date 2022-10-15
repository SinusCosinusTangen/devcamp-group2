//
//  REConfirmController+UITableView.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//
import UIKit

extension REConfirmController: UITableViewDelegate, UITableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ConfirmCell.identifier, for: indexPath) as? ConfirmCell else { return UITableViewCell() }
        return cell
    }
    
    
}
