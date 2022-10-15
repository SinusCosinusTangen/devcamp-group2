//
//  REDashboardController.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit
import RxSwift

// MARK: REDashboardController
public final class REDashboardController: UIViewController {
    
    // MARK: Dependency Variable
    lazy var _view: REDashboardView = DefaultREDashboardView()
    var viewModel: REDashboardViewModel!
    let disposeBag = DisposeBag()
    
    var userDetail: FetchUserDomain?
    var listItem = [ResultDomain]()
    
    class func create(with viewModel: REDashboardViewModel) -> REDashboardController {
        let controller = REDashboardController()
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
        setupRecycleButton()
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
    }
    
}

// MARK: Private Function
private extension REDashboardController {
    
    func bind(to viewModel: REDashboardViewModel) {
        self.observeOn(viewModel.userDetail.asObservable())
        self.observeOn(viewModel.listItem.asObservable())
    }
    
    func observeOn(_ observable: Observable<FetchUserDomain>) {
        observable
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] userDetail in
                guard let self = self else { return }
                self.userDetail = userDetail
                self._view.tableView.reloadData()
            }).disposed(by: self.disposeBag)
    }
    
    func observeOn(_ observable: Observable<[ResultDomain]>) {
        observable
            .subscribe(on: MainScheduler.instance)
            .subscribe(onNext: { [weak self] result in
                guard let self = self else { return }
                self.listItem = result
                self._view.tableView.reloadData()
            }).disposed(by: self.disposeBag)
    }
    
    func setupRecycleButton() {
        self._view.recycleButton.addTarget(self, action: #selector(self.didClickedButton), for: .touchUpInside)
    }
    @objc
    func didClickedButton() {
        guard let userDetail = self.userDetail else { return }
        self.viewModel.didClickedRecycleButton(id: userDetail.id)
    }
}

// MARK: REDashboardController+REDashboardViewDelegate
extension REDashboardController: REDashboardViewDelegate {
    
}
