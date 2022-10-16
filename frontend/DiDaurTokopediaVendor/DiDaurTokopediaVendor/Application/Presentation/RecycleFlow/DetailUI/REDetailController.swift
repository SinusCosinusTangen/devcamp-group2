//
//  REDetailController.swift
//  DiDaurTokopediaMitra
//
//  Created by Daffashiddiq on 16/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit

// MARK: REDetailController
public final class REDetailController: UIViewController {
    
    // MARK: Dependency Variable
    lazy var _view: REDetailView = DefaultREDetailView()
    var viewModel: REDetailViewModel!
    
    var resultDomain: ResultDomain?
    
    class func create(with viewModel: REDetailViewModel) -> REDetailController {
        let controller = REDetailController()
        controller.viewModel = viewModel
        return controller
    }
    
    public override func loadView() {
        self._view.delegate = self
        self.view = self._view.asView
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
        self.resultDomain = viewModel.resultDomain
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupViewWillAppear()
    }
    
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.setupViewWillDisappear()
    }
    
    func setupViewDidLoad() {
        setupTableView()
    }
    
    func setupViewWillAppear() {
        self._view.viewWillAppear(
            navigationBar: self.navigationController?.navigationBar,
            navigationItem: self.navigationItem,
            tabBarController: self.tabBarController
        )
    }
    
    func setupViewWillDisappear() {
        self._view.viewWillDisappear()
    }
    
    func setupTableView() {
        self._view.tableView.delegate = self
        self._view.tableView.dataSource = self
        self._view.tableView.rowHeight = UITableView.automaticDimension
        self._view.tableView.showsVerticalScrollIndicator = false
        self._view.tableView.separatorStyle = .none
        self._view.tableView.register(InProgressCell.self, forCellReuseIdentifier: InProgressCell.identifier)
        self._view.tableView.register(DetailCell.self, forCellReuseIdentifier: DetailCell.identifier)
    }
    
}

// MARK: Public Function
public extension REDetailController {
    
    func route(_ route: REDetailViewModelRoute) {
    }
    
}

// MARK: Private Function
private extension REDetailController {
    
    func bind(to viewModel: REDetailViewModel) {
    }
    
}

// MARK: REDetailController+REDetailViewDelegate
extension REDetailController: REDetailViewDelegate {
    
}
