//
//  UIButton+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation
import UIKit

extension UIButton {
    convenience init(text: String) {
        self.init()
        configuration = .filled()
        setTitle(text, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.setDefaultFont(size: 16, weight: .bold) // FIXME: 적용 안됨
        tintColor = .mainDeep
        titleLabel?.textColor = .white
        layer.cornerRadius = 18
    }
}
