//
//  SuccessCell.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//
import UIKit
import SnapKit

public class SuccessCell: UITableViewCell {
    static let identifier: String = String(describing: SuccessCell.self)
    
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "bikeIcon")
        return imageView
    }()
    
    lazy var confirmLabel: UILabel = {
        let label = UILabel()
        label.text = "Permintaan Diterima"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        return label
    }()
    
    lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Permintaan telah kami terima silakan tunggu petugas mendatangi alamat"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()

    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.backgroundColor = .white
        
        self.contentView.addSubview(self.containerView)
        self.containerView.addSubview(self.iconImageView)
        self.containerView.addSubview(self.confirmLabel)
        self.containerView.addSubview(self.detailLabel)
    
        self.containerView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        self.iconImageView.snp.makeConstraints {
            $0.top.equalTo(self.containerView.snp.top).offset(80)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(240)
        }
        
        self.confirmLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImageView.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        self.detailLabel.snp.makeConstraints {
            $0.top.equalTo(self.confirmLabel.snp.bottom).offset(15)
            $0.leading.equalTo(self.containerView.snp.leading).offset(90)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-90)
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-100)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
