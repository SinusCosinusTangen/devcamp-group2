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
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.headerView)
        self.headerView.addSubview(self.acceptLabel)
        self.headerView.addSubview(self.infoImageView)
        self.headerView.addSubview(self.detailLabel)
   
        self.headerView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(16)
            $0.leading.equalTo(self.contentView.snp.leading).offset(24)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-24)
            $0.bottom.equalTo(self.contentView)
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
    
    func setResult(result: ResultDomain) {
        self.detailLabel.text = "\(result.address)"
    }
}
