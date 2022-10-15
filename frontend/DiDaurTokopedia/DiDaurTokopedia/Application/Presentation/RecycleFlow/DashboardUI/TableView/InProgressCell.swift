//
//  InProgressCell.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 16/10/22.
//
import UIKit
import SnapKit

public class InProgressCell: UITableViewCell {
    static let identifier: String = String(describing: InProgressCell.self)
    
    lazy var progressLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.text = "Dalam Proses:"
        return label
    }()
    
    lazy var acceptLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "Permintaan diterima"
        label.textColor = .white
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .white
        label.numberOfLines = 0
        label.text = "Sampah akan diambil oleh petugas pada 09.00 WIB"
        return label
    }()
    
    lazy var infoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "infoIcon")
        return imageView
    }()
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.makeRound(cornerRad:8)
        view.backgroundColor = .systemGreen
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.progressLabel)
        self.containerView.addSubview(self.headerView)
        self.headerView.addSubview(self.acceptLabel)
        self.headerView.addSubview(self.infoImageView)
        self.headerView.addSubview(self.detailLabel)
   
                
        self.containerView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(16)
            $0.bottom.leading.trailing.equalTo(self.contentView)
        }
        
        self.progressLabel.snp.makeConstraints {
            $0.top.equalTo(self.containerView.snp.top)
            $0.leading.equalTo(self.containerView.snp.leading).offset(16)
        }
        
        self.headerView.snp.makeConstraints {
            $0.top.equalTo(self.progressLabel.snp.bottom).offset(8)
            $0.leading.equalTo(self.containerView.snp.leading).offset(16)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-16)
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-10)
        }
        
        self.acceptLabel.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.top).offset(16)
            $0.leading.equalTo(self.headerView.snp.leading).offset(16)
        }
        
        self.infoImageView.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.top).offset(16)
            $0.trailing.equalTo(self.headerView.snp.trailing).offset(-16)
            $0.height.width.equalTo(18)
        }
        
        self.detailLabel.snp.makeConstraints {
            $0.top.equalTo(self.acceptLabel.snp.bottom).offset(5)
            $0.leading.equalTo(self.headerView.snp.leading).offset(16)
            $0.trailing.equalTo(self.headerView.snp.trailing).offset(-16)
            $0.bottom.equalTo(self.headerView.snp.bottom).offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
