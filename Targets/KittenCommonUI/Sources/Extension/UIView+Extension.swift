//
//  UIView+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/18/24.
//

import Foundation
import UIKit

public extension UIView {
    
    // FIXME: 그림자 레이어랑 코너 레이어랑 분리해야함
    func addShadowWithRoundedCorners(cornerRadius: CGFloat = 10) {
        backgroundColor = .white

        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        layer.shadowOffset = CGSize(width: 0, height: 0)

        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        layer.shadowPath = shadowPath.cgPath
    }
}
