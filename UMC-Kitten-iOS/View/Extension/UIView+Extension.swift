//
//  UIView+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/18/24.
//

import Foundation
import UIKit

extension UIView {
    func addShadowWithRoundedCorners(cornerRadius: CGFloat = 10) {
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
