//
//  ConfirmCell.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//
import UIKit
import SnapKit

public class ConfirmCell: UITableViewCell {
    static let identifier: String = String(describing: ConfirmCell.self)
    
    // MARK: REConfirmViewSubview
    lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "termIcon")
        return imageView
    }()
    
    lazy var pickupLabel: UILabel = {
        let label = UILabel()
        label.text = "Ketentuan Penjemputan"
        label.font = UIFont.boldSystemFont(ofSize: 20.0)
        label.textColor = .black
        return label
    }()
    
    lazy var oneLabel: UILabel = {
        let label = UILabel()
        label.text = "1"
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        label.textColor = .black
        return label
    }()
    
    lazy var twoLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        label.textColor = .black
        return label
    }()
    
    lazy var threeLabel: UILabel = {
        let label = UILabel()
        label.text = "3"
        label.font = UIFont.boldSystemFont(ofSize: 32.0)
        label.textColor = .black
        return label
    }()
    
    lazy var firstConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Pengguna menyiapkan sampah plastik yang akan diangkut oleh petugas"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var secondConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Petugas akan mengangkut sampah setiap hari mulai dari pukul 09.00 WIB"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    lazy var thirdConditionLabel: UILabel = {
        let label = UILabel()
        label.text = "Pastikan nomor handphone dalam keadaan aktif selalu"
        label.font = UIFont.systemFont(ofSize: 14, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
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
        self.containerView.addSubview(self.pickupLabel)
        self.containerView.addSubview(self.oneLabel)
        self.containerView.addSubview(self.twoLabel)
        self.containerView.addSubview(self.threeLabel)
        self.containerView.addSubview(self.firstConditionLabel)
        self.containerView.addSubview(self.secondConditionLabel)
        self.containerView.addSubview(self.thirdConditionLabel)
                
        self.containerView.snp.makeConstraints {
            $0.top.bottom.leading.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
        }
        
        self.iconImageView.snp.makeConstraints {
            $0.top.equalTo(self.containerView.snp.top).offset(80)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(240)
        }
        
        self.pickupLabel.snp.makeConstraints {
            $0.top.equalTo(self.iconImageView.snp.bottom).offset(32)
            $0.centerX.equalToSuperview()
        }
        
        self.oneLabel.snp.makeConstraints {
            $0.top.equalTo(self.pickupLabel.snp.bottom).offset(32)
            $0.leading.equalTo(self.containerView.snp.leading).offset(48)
        }
        
        self.firstConditionLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.oneLabel)
            $0.leading.equalTo(self.oneLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-48)
        }
        
        self.twoLabel.snp.makeConstraints {
            $0.top.equalTo(self.oneLabel.snp.bottom).offset(27)
            $0.leading.equalTo(self.containerView.snp.leading).offset(48)
        }
        
        self.secondConditionLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.twoLabel)
            $0.leading.equalTo(self.twoLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-48)
        }
        
        self.threeLabel.snp.makeConstraints {
            $0.top.equalTo(self.twoLabel.snp.bottom).offset(27)
            $0.leading.equalTo(self.containerView.snp.leading).offset(48)
            $0.bottom.equalTo(self.containerView.snp.bottom).offset(-100)
        }
        
        self.thirdConditionLabel.snp.makeConstraints {
            $0.centerY.equalTo(self.threeLabel)
            $0.leading.equalTo(self.threeLabel.snp.trailing).offset(10)
            $0.trailing.equalTo(self.containerView.snp.trailing).offset(-48)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
