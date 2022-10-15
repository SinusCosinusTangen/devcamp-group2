//
//  REConfirmController.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit

// MARK: REConfirmController
public final class REConfirmController: UIViewController {
    
    // MARK: Dependency Variable
    lazy var _view: REConfirmView = DefaultREConfirmView()
    var viewModel: REConfirmViewModel!
    
    class func create(with viewModel: REConfirmViewModel) -> REConfirmController {
        let controller = REConfirmController()
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
        setupTermLabel()
        setupConfirmButton()
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
        self._view.tableView.register(ConfirmCell.self, forCellReuseIdentifier: ConfirmCell.identifier)
    }
    
    func setupTermLabel() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didClickedTermLabel))
        self._view.termLabel.addGestureRecognizer(tapGesture)
        self._view.termButton.addTarget(self, action: #selector(self.didClickedTermLabel), for: .touchUpInside)
    }
    
    @objc
    func didClickedTermLabel() {
        self._view.setConfirmButtonEnable(!self._view.confirmButton.isEnabled)
        UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
            self._view.termButton.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }) { (success) in
            UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveLinear, animations: {
                self._view.termButton.isSelected = !self._view.termButton.isSelected
                self._view.termButton.transform = .identity
            }, completion: nil)
        }
    }
    
    func setupConfirmButton() {
        self._view.confirmButton.addTarget(self, action: #selector(self.didClickedConfirmButton), for: .touchUpInside)
    }
    
    @objc
    func didClickedConfirmButton() {
        self.viewModel.didClickedConfirmButton()
    }
    
}

// MARK: Private Function
private extension REConfirmController {
    
    func bind(to viewModel: REConfirmViewModel) {
    }
    
}

// MARK: REConfirmController+REConfirmViewDelegate
extension REConfirmController: REConfirmViewDelegate {
    
}
