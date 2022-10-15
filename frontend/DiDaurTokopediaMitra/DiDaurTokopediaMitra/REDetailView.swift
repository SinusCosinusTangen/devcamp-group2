//
//  REDetailView.swift
//  DiDaurTokopediaMitra
//
//  Created by Daffashiddiq on 16/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit
import SnapKit

// MARK: REDetailViewDelegate
public protocol REDetailViewDelegate: AnyObject {
}

// MARK: REDetailViewFunction
public protocol REDetailViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
}

// MARK: REDetailViewSubview
public protocol REDetailViewSubview {
}

// MARK: REDetailViewVariable
public protocol REDetailViewVariable {
    var asView: UIView! { get }
    var delegate: REDetailViewDelegate? { get set }
    var tableView: UITableView { get set }
}

// MARK: REDetailView
public protocol REDetailView: REDetailViewFunction, REDetailViewSubview, REDetailViewVariable { }

// MARK: DefaultREDetailView
public final class DefaultREDetailView: UIView, REDetailView {
    
    // MARK: REDetailViewSubview
    public var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    // MARK: REDetailViewVariable
    public var asView: UIView!
    public weak var delegate: REDetailViewDelegate?
    
    // MARK: Init Function
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(frame: UIScreen.main.fixedCoordinateSpace.bounds)
        self.subviewWillAdd()
        self.subviewConstraintWillMake()
        self.viewDidInit()
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.subviewDidLayout()
    }
    
}

// MARK: Input Function
public extension DefaultREDetailView {
    
    func viewWillAppear(
        navigationBar: UINavigationBar?,
        navigationItem: UINavigationItem,
        tabBarController: UITabBarController?
    ) {
        
    }
    
    func viewWillDisappear() {
        
    }
    
}

// MARK: Private Function
private extension DefaultREDetailView {
    
    func subviewDidLayout() {
    }
    
    func subviewWillAdd() {
        self.addSubview(self.tableView)
    }
    
    func subviewConstraintWillMake() {
        self.tableView.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalTo(self.safeAreaLayoutGuide)
        }
    }
    
    func viewDidInit() {
        self.asView = self
    }
    
}
