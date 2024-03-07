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
        self.image = KittenUIImages(name: imageName).image
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
    }
    
    /// 이미지 위에 검정 그라데이션 오버레이 레이어를 올립니다.
    ///
    /// - Important: 이미지의 bounds가 결정된 후 사용해야하므로  layoutSubviews(override func)를 내부에서 사용해주세요.
    func addOverlayGradientLayer() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [
            UIColor.black.withAlphaComponent(0.2).cgColor,
            UIColor.black.withAlphaComponent(0).cgColor
        ]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.8)
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 0)
        
        let overlayLayer = CALayer()
        overlayLayer.addSublayer(gradientLayer)
        self.layer.addSublayer(overlayLayer)
    }
}
