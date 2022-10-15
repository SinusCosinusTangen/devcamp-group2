//
//  InProgressCell.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 16/10/22.
//
import UIKit
import SnapKit

protocol DetailCellDelegate: AnyObject {
    func didClickDoneButton(weight: Int)
}

public class DetailCell: UITableViewCell {
    static let identifier: String = String(describing: DetailCell.self)
    
    weak var delegate: DetailCellDelegate?
    
    lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.text = "Lokasi pengambilan"
        label.textColor = .black
        return label
    }()
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Informasi sampah"
        return label
    }()
    
    lazy var weightLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 12, weight: .light)
        label.textColor = .black
        label.numberOfLines = 0
        label.text = "Berat"
        return label
    }()
    
    lazy var mapImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mapImage")
        imageView.makeRound(cornerRad:8)
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        return textField
    }()
    
    public lazy var doneButton: UIButton = .roundedButton(type: .fill, title: "Selesai", themeColor: .systemGreen, textSize: 16, radius: 8, titleColor: .white, isEnabled: true)
    
    lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.contentView.addSubview(self.headerView)
        self.headerView.addSubview(self.locationLabel)
        self.headerView.addSubview(self.mapImageView)
        self.headerView.addSubview(self.infoLabel)
        self.headerView.addSubview(self.weightLabel)
        self.headerView.addSubview(self.textField)
        self.headerView.addSubview(self.doneButton)
        
        self.headerView.snp.makeConstraints {
            $0.top.equalTo(self.contentView.snp.top).offset(16)
            $0.leading.equalTo(self.contentView.snp.leading).offset(24)
            $0.trailing.equalTo(self.contentView.snp.trailing).offset(-24)
            $0.bottom.equalTo(self.contentView)
        }
        
        self.locationLabel.snp.makeConstraints {
            $0.top.equalTo(self.headerView.snp.top)
            $0.leading.equalTo(self.headerView.snp.leading)
        }
        
        self.mapImageView.snp.makeConstraints {
            $0.top.equalTo(self.locationLabel.snp.bottom).offset(10)
            $0.leading.equalTo(self.headerView.snp.leading)
            $0.trailing.equalTo(self.headerView.snp.trailing)
            $0.height.equalTo(100)
        }
        
        self.infoLabel.snp.makeConstraints {
            $0.top.equalTo(self.mapImageView.snp.bottom).offset(30)
            $0.leading.equalTo(self.headerView.snp.leading)
        }
        
        self.weightLabel.snp.makeConstraints {
            $0.top.equalTo(self.infoLabel.snp.bottom).offset(13)
            $0.leading.equalTo(self.headerView.snp.leading)
        }
        
        self.textField.snp.makeConstraints {
            $0.top.equalTo(self.weightLabel.snp.bottom)
            $0.leading.equalTo(self.headerView.snp.leading)
            $0.trailing.equalTo(self.headerView.snp.trailing)
            $0.height.equalTo(40)
        }
        
        self.doneButton.snp.makeConstraints {
            $0.top.equalTo(self.textField.snp.bottom).offset(20)
            $0.leading.equalTo(self.headerView.snp.leading)
            $0.trailing.equalTo(self.headerView.snp.trailing)
            $0.height.equalTo(40)
            $0.bottom.equalTo(self.headerView.snp.bottom)
        }
        
        self.doneButton.addTarget(self, action: #selector(self.didClickButton), for: .touchUpInside)
    }
    
    @objc
    func didClickButton() {
        let weight = Int(self.textField.text ?? "1")
        self.delegate?.didClickDoneButton(weight: weight ?? 1)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
