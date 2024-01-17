//
//  UIImageView+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/17/24.
//

import Foundation
import UIKit

extension UIImageView {
    convenience init(imageName: String) {
        self.init()
        self.image = UIImage(named: imageName)
    }
}
