//
//  UIButton+Extension.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import UIKit

public extension UIButton {
    
    enum RoundedButtonType {
        case fill
        case stroke
    }
    
    static func roundedButton(type: RoundedButtonType, title: String, themeColor: UIColor = .green, textSize: CGFloat = 16, radius: CGFloat = 20, titleColor: UIColor = .green, isEnabled: Bool = true) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleEdgeInsets = UIEdgeInsets(top: 6, left: 12, bottom: 6, right: 12)
        button.isEnabled = isEnabled
        
        switch type {
        case .fill:
            button.setTitleColor(titleColor, for: .normal)
            button.makeRound(clipToBounds: true, cornerRad: radius)
            button.backgroundColor = themeColor
        case .stroke:
            button.setTitleColor(themeColor, for: .normal)
            button.makeRound(borderColor: themeColor, borderWidth: 1, clipToBounds: true, cornerRad: radius)
            button.backgroundColor = .clear
        }
        return button
    }
    
}
