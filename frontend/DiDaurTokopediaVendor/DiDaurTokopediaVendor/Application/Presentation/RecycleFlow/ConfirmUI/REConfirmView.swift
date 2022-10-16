//
//  REConfirmView.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//  Copyright (c) 2022 All rights reserved.

import UIKit
import SnapKit

// MARK: REConfirmViewDelegate
public protocol REConfirmViewDelegate: AnyObject {
}

// MARK: REConfirmViewFunction
public protocol REConfirmViewFunction {
    func viewWillAppear(navigationBar: UINavigationBar?,
                        navigationItem: UINavigationItem,
                        tabBarController: UITabBarController?)
    func viewWillDisappear()
    func setConfirmButtonEnable(_ state: Bool)
}

// MARK: REConfirmViewSubview
public protocol REConfirmViewSubview {
}

// MARK: REConfirmViewVariable
public protocol REConfirmViewVariable {
    var asView: UIView! { get }
    var delegate: REConfirmViewDelegate? { get set }
    var tableView: UITableView { get set }
    var termLabel: UILabel { get set }
    var termButton: UIButton { get set }
    var confirmButton: UIButton { get set }
}

// MARK: REConfirmView
public protocol REConfirmView: REConfirmViewFunction, REConfirmViewSubview, REConfirmViewVariable { }

// MARK: DefaultREConfirmView
public final class DefaultREConfirmView: UIView, REConfirmView {
    
    public lazy var tableView: UITableView = {
        let tableView = UITableView()
        return tableView
    }()
    
    public lazy var termButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "checkedIcon"), for: .selected)
        button.setImage(UIImage(named: "normalIcon"), for: .normal)
        return button
    }()

    public lazy var termLabel: UILabel = {
        let label = UILabel()
        label.text = "Saya menyetujui ketentuan di atas"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.isUserInteractionEnabled = true
        return label
    }()
    
    public lazy var confirmButton: UIButton = .roundedButton(type: .fill, title: "Kirim Permintaan", themeColor: .lightGray, textSize: 16, radius: 8, titleColor: .white, isEnabled: false)
    
    // MARK: REConfirmViewVariable
    public var asView: UIView!
    public weak var delegate: REConfirmViewDelegate?
    
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
public extension DefaultREConfirmView {
    
    func viewWillAppear(
        navigationBar: UINavigationBar?,
        navigationItem: UINavigationItem,
        tabBarController: UITabBarController?
    ) {
        
    }
    
    func viewWillDisappear() {
        
    }
    
    func setConfirmButtonEnable(_ state: Bool) {
        if state {
            self.confirmButton.isEnabled = true
            self.confirmButton.backgroundColor = .systemGreen
        } else {
            self.confirmButton.isEnabled = false
            self.confirmButton.backgroundColor = .lightGray
        }
    }
    
}

// MARK: Private Function
private extension DefaultREConfirmView {
    
    func subviewDidLayout() {
    }
    
    func subviewWillAdd() {
        self.addSubview(self.tableView)
        self.addSubview(self.termButton)
        self.addSubview(self.termLabel)
        self.addSubview(self.confirmButton)
    }
    
    func subviewConstraintWillMake() {
        self.tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide)
            $0.bottom.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
        
        self.termButton.snp.makeConstraints {
            $0.bottom.equalTo(self.confirmButton.snp.top).offset(-10)
            $0.trailing.equalTo(self.termLabel.snp.leading).offset(-10)
            $0.width.height.equalTo(18)
        }
        
        self.termLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.safeAreaLayoutGuide.snp.centerX)
            $0.centerY.equalTo(self.termButton)
        }
        
        self.confirmButton.snp.makeConstraints {
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(24)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-24)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-24)
            $0.height.equalTo(40)
        }
    }
    
    func viewDidInit() {
        self.asView = self
        self.backgroundColor = .white
    }
    
}
