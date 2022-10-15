//
//  REDashboardView.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit
import SnapKit

// MARK: REDashboardViewDelegate
public protocol REDashboardViewDelegate: AnyObject {
}

// MARK: REDashboardViewFunction
public protocol REDashboardViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
}

// MARK: REDashboardViewSubview
public protocol REDashboardViewSubview {
}

// MARK: REDashboardViewVariable
public protocol REDashboardViewVariable {
    var asView: UIView! { get }
    var delegate: REDashboardViewDelegate? { get set }
    var tableView: UITableView { get set }
    var refreshControl: UIRefreshControl { get set }
    var recycleButton: UIButton { get set }
}

// MARK: REDashboardView
public protocol REDashboardView: REDashboardViewFunction, REDashboardViewSubview, REDashboardViewVariable { }

// MARK: DefaultREDashboardView
public final class DefaultREDashboardView: UIView, REDashboardView {
    
    // MARK: REDashboardViewSubview
    public lazy var refreshControl: UIRefreshControl = {
        var refresh = UIRefreshControl()
        refresh.tintColor = .black
        return refresh
    }()
    
    lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Halo, Bank Sampah"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        return label
    }()
    
    lazy var subHeaderLabel: UILabel = {
        let label = UILabel()
        label.text = "Permintaan angkut:"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        return label
    }()
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.refreshControl = self.refreshControl
        return tableView
    }()
    
    public lazy var recycleButton: UIButton = .roundedButton(type: .fill, title: "Daur Sekarang!", themeColor: .systemGreen, textSize: 16, radius: 8, titleColor: .white, isEnabled: true)
    
    // MARK: REDashboardViewVariable
    public var asView: UIView!
    public weak var delegate: REDashboardViewDelegate?
    
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
public extension DefaultREDashboardView {
    
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
private extension DefaultREDashboardView {
    
    func subviewDidLayout() {
    }
    
    func subviewWillAdd() {
        self.addSubview(self.headerLabel)
        self.addSubview(self.subHeaderLabel)
        self.addSubview(self.tableView)
        self.addSubview(self.recycleButton)
    }
    
    func subviewConstraintWillMake() {
        self.headerLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(24)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(24)
        }
        
        self.subHeaderLabel.snp.makeConstraints {
            $0.top.equalTo(self.headerLabel.snp.bottom).offset(20)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(24)
        }
        
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.subHeaderLabel.snp.bottom).offset(10)
            $0.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.recycleButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-10)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(24)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-24)
            $0.height.equalTo(40)
        }
    }
    
    func viewDidInit() {
        self.asView = self
    }
    
}
