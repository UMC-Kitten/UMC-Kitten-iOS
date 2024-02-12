//
//  UIImage+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

extension UIImage {
    
    /// 이미지의 투명도를 조절합니다.
    func withAlpha(_ alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }

        guard let ctx = UIGraphicsGetCurrentContext(), let cgImage = cgImage else { return nil }
        
        ctx.scaleBy(x: 1, y: -1)
        ctx.translateBy(x: 0, y: -size.height)
        ctx.setBlendMode(.normal)
        ctx.setAlpha(alpha)
        ctx.draw(cgImage, in: CGRect(origin: .zero, size: size))
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
