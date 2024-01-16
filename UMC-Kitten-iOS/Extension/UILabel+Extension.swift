//
//  Font+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/16/24.
//

import Foundation
import UIKit

enum FontWeight
{
    case black, extraBold, bold, semiBold
    case medium, regular, light, extraLight, thin
}

extension UILabel {
    func setDefaultFont(
        size: CGFloat = 16,
        weight: FontWeight = .regular
    ){
        switch (weight) {
        case .black:
            self.font = UIFont(name: "Pretendard-Black", size: size)
        case .extraBold:
            self.font = UIFont(name: "Pretendard-ExtraBold", size: size)
        case .bold:
            self.font = UIFont(name: "Pretendard-Bold", size: size)
        case .semiBold:
            self.font = UIFont(name: "Pretendard-SemiBold", size: size)
        case .medium:
            self.font = UIFont(name: "Pretendard-Medium", size: size)
        case .regular:
            self.font = UIFont(name: "Pretendard-Regular", size: size)
        case .light:
            self.font = UIFont(name: "Pretendard-Light", size: size)
        case .extraLight:
            self.font = UIFont(name: "Pretendard-ExtraLight", size: size)
        case .thin:
            self.font = UIFont(name: "Pretendard-Thin", size: size)
        }
    }
}
