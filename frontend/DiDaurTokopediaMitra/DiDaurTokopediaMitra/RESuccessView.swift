//
//  RESuccessView.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit
import SnapKit

// MARK: RESuccessViewDelegate
public protocol RESuccessViewDelegate: AnyObject {
}

// MARK: RESuccessViewFunction
public protocol RESuccessViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
}

// MARK: RESuccessViewSubview
public protocol RESuccessViewSubview {
}

// MARK: RESuccessViewVariable
public protocol RESuccessViewVariable {
    var asView: UIView! { get }
    var delegate: RESuccessViewDelegate? { get set }
    var tableView: UITableView { get set }
    var doneButton: UIButton { get set }
}

// MARK: RESuccessView
public protocol RESuccessView: RESuccessViewFunction, RESuccessViewSubview, RESuccessViewVariable { }

// MARK: DefaultRESuccessView
public final class DefaultRESuccessView: UIView, RESuccessView {
    
    // MARK: RESuccessViewSubview
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    public lazy var doneButton: UIButton = .roundedButton(type: .fill, title: "Halaman Utama", themeColor: .systemGreen, textSize: 16, radius: 8, titleColor: .white, isEnabled: true)
    
    // MARK: RESuccessViewVariable
    public var asView: UIView!
    public weak var delegate: RESuccessViewDelegate?
    
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
public extension DefaultRESuccessView {
    
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
private extension DefaultRESuccessView {
    
    func subviewDidLayout() {
    }
    
    func subviewWillAdd() {
        self.addSubview(self.tableView)
        self.addSubview(self.doneButton)
    }
    
    func subviewConstraintWillMake() {
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        self.doneButton.snp.makeConstraints {
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(24)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-24)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-24)
            $0.height.equalTo(40)
        }
    }
    
    func viewDidInit() {
        self.asView = self
    }
    
}
