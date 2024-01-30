//
//  UIButton+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation
import UIKit

extension UIButton {
    
    /// 이미지없이 텍스트만 있는 버튼을 생성합니다.
    ///
    /// - TODO: 폰트에 따른 설정 추가 필요
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
    
    /// 텍스트 없이 이미지만 있는 버튼을 생성합니다.
    convenience init(image: UIImage) {
        self.init()
        configuration = .filled()
        setImage(image, for: .normal)
        setTitle("", for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.setDefaultFont(size: 16, weight: .bold) // FIXME: 적용 안됨
        tintColor = .clear
        titleLabel?.textColor = .white
        layer.cornerRadius = 18
    }
}
