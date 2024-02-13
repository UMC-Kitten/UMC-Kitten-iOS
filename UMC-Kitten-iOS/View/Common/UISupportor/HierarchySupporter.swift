//
//  HierarchySupporter.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import UIKit

/// 뷰의 계층 구조를 설정을 돕습니다.
class HierarchySupporter {
    
    /// UIScrollView와 그 내부의 contentView를 설정하고, contentView에 서브뷰들을 추가합니다.
    ///
    /// - Parameters:
    ///   - view: UIScrollView와 서브뷰들이 추가될 슈퍼뷰입니다.
    ///   - scrollView: 설정할 UIScrollView입니다. 이 스크롤뷰는 주어진 view의 가장자리에 맞춰집니다.
    ///   - contentView: scrollView의 내부에 위치할 contentView입니다. 이 contentView에는 서브뷰들이 추가됩니다.
    ///   - subviews: contentView에 추가될 서브뷰들의 배열입니다.
    static func setupScrollView(
        in view: UIView,
        scrollView: BaseScrollView,
        addingSubviews subviews: [UIView]
    ) {
        view.addSubview(scrollView)
        setupSubviews(to: scrollView.contentView, views: subviews)
    }
    
    /// 지정된 슈퍼뷰에 하나 이상의 서브뷰를 추가합니다.
    ///
    /// - Parameters:
    ///   - superView: 서브뷰들이 추가될 슈퍼뷰입니다.
    ///   - views: 슈퍼뷰에 추가될 뷰들의 배열입니다.
    ///            배열에 포함된 순서대로 뷰가 슈퍼뷰에 추가됩니다.
    static func setupSubviews(to superView: UIView, views: [UIView]) {
        views.forEach { superView.addSubview($0) }
    }
}

