//
//  RESuccessController.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit

// MARK: RESuccessController
public final class RESuccessController: UIViewController {
    
    // MARK: Dependency Variable
    lazy var _view: RESuccessView = DefaultRESuccessView()
    var viewModel: RESuccessViewModel!
    
    class func create(with viewModel: RESuccessViewModel) -> RESuccessController {
        let controller = RESuccessController()
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
        setupDoneButton()
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
        self._view.tableView.register(SuccessCell.self, forCellReuseIdentifier: SuccessCell.identifier)
    }
    
    func setupDoneButton() {
        self._view.doneButton.addTarget(self, action: #selector(self.didClickedDoneButton), for: .touchUpInside)
    }
    @objc
    func didClickedDoneButton() {
        self.viewModel.didClickedDoneButton()
    }
}

// MARK: Public Function
public extension RESuccessController {
    
    func route(_ route: RESuccessViewModelRoute) {
    }
    
}

// MARK: Private Function
private extension RESuccessController {
    
    func bind(to viewModel: RESuccessViewModel) {
    }
    
}

// MARK: RESuccessController+RESuccessViewDelegate
extension RESuccessController: RESuccessViewDelegate {
    
}
