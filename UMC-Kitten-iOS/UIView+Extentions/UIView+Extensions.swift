//
//  UIView+Extensions.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
}
