////
////  DashboardCell.swift
////  DiDaurTokopedia
////
////  Created by Daffashiddiq on 15/10/22.
////
//import UIKit
//import SnapKit
//
//public class DashboardCell: UITableViewCell {
//    static let identifier: String = String(describing: DashboardCell.self)
//
//    lazy var nameLabel: UILabel = {
//        let label = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 20.0)
//        label.textColor = .black
//        return label
//    }()
//
//    lazy var locationImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "locationIcon")
//        return imageView
//    }()
//
//    lazy var addressLabel: UILabel = {
//        let label = UILabel()
//        label.textColor = .black
//        label.font = label.font.withSize(15)
//        return label
//    }()
//
//    lazy var headerView: UIView = {
//        let view = UIView()
//        view.makeRound(cornerRad:8)
//        view.backgroundColor = .systemGreen
//        return view
//    }()
//
//    lazy var rewardLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Reward Terkumpul"
//        label.font = UIFont.boldSystemFont(ofSize: 15.0)
//        label.textColor = .white
//        return label
//    }()
//
//    lazy var progressContainerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.makeRound(cornerRad: 8)
//        return view
//    }()
//
//    lazy var starImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "starIcon")
//        return imageView
//    }()
//
//    lazy var xpLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//
//    lazy var progessView: UIProgressView = {
//        let progressBar = UIProgressView(progressViewStyle: .bar)
//        progressBar.center = self.center
//        progressBar.trackTintColor = .lightGray
//        progressBar.tintColor = .systemBlue
//        progressBar.makeRound(cornerRad: 5)
//        return progressBar
//    }()
//
//    lazy var coinContainerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.makeRound(cornerRad: 8)
//        return view
//    }()
//
//    lazy var coinLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//
//    lazy var separatorView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .lightGray
//        return view
//    }()
//
//    lazy var barImageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "barIcon")
//        return imageView
//    }()
//
//    lazy var xpNumberLabel: UILabel = {
//        let label = UILabel()
//        return label
//    }()
//
//    lazy var recycleButton: UIButton = .roundedButton(type: .fill, title: "Daur Sekarang!", themeColor: .systemGreen, textSize: 16, radius: 8, titleColor: .white, isEnabled: true)
//
//    lazy var containerView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        return view
//    }()
//
//    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//
//        self.contentView.addSubview(self.containerView)
//        self.containerView.addSubview(self.nameLabel)
//        self.containerView.addSubview(self.locationImageView)
//        self.containerView.addSubview(self.addressLabel)
//
//        self.containerView.addSubview(self.headerView)
//        self.headerView.addSubview(self.rewardLabel)
//        self.headerView.addSubview(self.progressContainerView)
//
//        self.progressContainerView.addSubview(self.starImageView)
//        self.progressContainerView.addSubview(self.xpLabel)
//        self.progressContainerView.addSubview(self.progessView)
//
//        self.headerView.addSubview(self.coinContainerView)
//        self.coinContainerView.addSubview(self.coinLabel)
//        self.coinContainerView.addSubview(self.separatorView)
//        self.coinContainerView.addSubview(self.barImageView)
//        self.coinContainerView.addSubview(self.xpNumberLabel)
//
//        self.containerView.snp.makeConstraints {
//            $0.top.equalTo(self.contentView.safeAreaLayoutGuide.snp.top).offset(16)
//            $0.bottom.leading.trailing.equalTo(self.contentView.safeAreaLayoutGuide)
//        }
//
//        self.nameLabel.snp.makeConstraints {
//            $0.top.equalTo(self.containerView.snp.top)
//            $0.leading.equalTo(self.containerView.snp.leading).offset(24)
//        }
//
//        self.locationImageView.snp.makeConstraints {
//            $0.top.equalTo(self.nameLabel.snp.bottom).offset(8)
//            $0.leading.equalTo(self.containerView.snp.leading).offset(24)
//            $0.height.width.equalTo(18)
//        }
//
//        self.addressLabel.snp.makeConstraints {
//            $0.centerY.equalTo(self.locationImageView)
//            $0.leading.equalTo(self.locationImageView.snp.trailing).offset(4)
//        }
//
//        self.headerView.snp.makeConstraints {
//            $0.top.equalTo(self.addressLabel.snp.bottom).offset(24)
//            $0.leading.equalToSuperview().offset(16)
//            $0.trailing.equalToSuperview().offset(-16)
//            $0.bottom.equalTo(self.containerView.snp.bottom)
//            $0.height.equalTo(160)
//        }
//
//        self.rewardLabel.snp.makeConstraints {
//            $0.top.equalTo(self.headerView.snp.top).offset(16)
//            $0.leading.equalTo(self.headerView.snp.leading).offset(16)
//        }
//
//        self.progressContainerView.snp.makeConstraints {
//            $0.top.equalTo(self.rewardLabel.snp.bottom).offset(8)
//            $0.leading.equalTo(self.headerView.snp.leading).offset(16)
//            $0.trailing.equalTo(self.headerView.snp.trailing).offset(-16)
//            $0.height.equalTo(60)
//        }
//
//        self.starImageView.snp.makeConstraints {
//            $0.top.equalTo(self.progressContainerView.snp.top).offset(16)
//            $0.leading.equalTo(self.progressContainerView.snp.leading).offset(16)
//            $0.height.width.equalTo(10)
//        }
//
//        self.xpLabel.snp.makeConstraints {
//            $0.centerY.equalTo(self.starImageView)
//            $0.leading.equalTo(self.starImageView.snp.trailing).offset(8)
//        }
//
//        self.progessView.snp.makeConstraints {
//            $0.top.equalTo(self.xpLabel.snp.bottom).offset(5)
//            $0.trailing.equalTo(self.progressContainerView.snp.trailing).offset(-16)
//            $0.leading.equalTo(self.progressContainerView.snp.leading).offset(16)
//            $0.height.equalTo(10)
//        }
//
//        self.coinContainerView.snp.makeConstraints {
//            $0.top.equalTo(self.progressContainerView.snp.bottom).offset(8)
//            $0.leading.equalTo(self.headerView.snp.leading).offset(16)
//            $0.trailing.equalTo(self.headerView.snp.trailing).offset(-16)
//            $0.height.equalTo(40)
//        }
//
//        self.coinLabel.snp.makeConstraints {
//            $0.centerY.equalTo(self.coinContainerView)
//            $0.leading.equalTo(self.coinContainerView.snp.leading).offset(16)
//        }
//
//        self.separatorView.snp.makeConstraints {
//            $0.centerX.centerY.equalTo(self.coinContainerView)
//            $0.width.equalTo(1)
//            $0.height.equalTo(20)
//        }
//
//        self.barImageView.snp.makeConstraints {
//            $0.centerY.equalTo(self.coinContainerView)
//            $0.leading.equalTo(self.separatorView.snp.trailing).offset(16)
//        }
//
//        self.xpNumberLabel.snp.makeConstraints {
//            $0.centerY.equalTo(self.coinContainerView)
//            $0.leading.equalTo(self.barImageView.snp.trailing).offset(8)
//        }
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    func setValue(userDetail: FetchUserDomain?) {
//        guard let userDetail = userDetail else { return }
//
//        self.nameLabel.text = "Halo, \(userDetail.name)"
//
//        let addressText = NSMutableAttributedString(
//            string: "Diambil di",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ])
//        addressText.append(NSAttributedString(
//            string: " \(userDetail.address)",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ]))
//        self.addressLabel.attributedText = addressText
//
//        let xpText = NSMutableAttributedString(
//            string: "\(userDetail.exp) XP",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ])
//        xpText.append(NSAttributedString(
//            string: " untuk level selanjutnya",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ]))
//        self.xpLabel.attributedText = xpText
//
//        self.progessView.setProgress(Float(userDetail.exp), animated: true)
//
//        let coinText = NSMutableAttributedString(
//            string: "Rp",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.blue
//            ])
//        coinText.append(NSAttributedString(
//            string: " \(userDetail.coins)",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ]))
//        coinText.append(NSAttributedString(
//            string: " coins",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ]))
//        self.coinLabel.attributedText = coinText
//
//
//        let xpNumberText = NSMutableAttributedString(
//            string: "\(userDetail.exp)",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .bold),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ])
//        xpNumberText.append(NSAttributedString(
//            string: " XP",
//            attributes: [
//                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 12, weight: .light),
//                NSAttributedString.Key.foregroundColor: UIColor.black
//            ]))
//
//        self.xpNumberLabel.attributedText = xpNumberText
//    }
//}
