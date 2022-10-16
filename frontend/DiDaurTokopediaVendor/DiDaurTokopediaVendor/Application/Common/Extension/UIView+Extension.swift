//
//  UIView+Extension.swift
//  DiDaurTokopedia
//
//  Created by Daffashiddiq on 15/10/22.
//

import UIKit

public extension UIView {
    
    func makeRound(borderColor: UIColor? = nil,
                   borderWidth: CGFloat = 1,
                   clipToBounds: Bool = true,
                   cornerRad: CGFloat = 10.0,
                   cornerEdges: CACornerMask = [.layerMinXMinYCorner,
                                                .layerMinXMaxYCorner,
                                                .layerMaxXMinYCorner,
                                                .layerMaxXMaxYCorner]) {
        self.clipsToBounds = clipToBounds
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRad
        
        if !cornerEdges.isEmpty {
            self.layer.maskedCorners = cornerEdges
        }
        
        guard borderColor != nil else { return }
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
    
}
