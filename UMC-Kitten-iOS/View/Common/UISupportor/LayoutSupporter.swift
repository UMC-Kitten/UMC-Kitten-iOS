//
//  LayoutSupporter.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import UIKit

import SnapKit

/// Auto layout 설정을 돕습니다.
class LayoutSupporter {
    
    /// 뷰 배열을 받아 수직으로 순차적으로 레이아웃합니다.
    ///
    /// - Parameters:
    ///   - views: 순차적으로 배열할 뷰들의 배열입니다.
    ///   - startingBelow: 배열의 첫 번째 뷰가 위치할 시작 지점 뷰입니다. 이 뷰의 아래에 첫 번째 뷰가 배치됩니다.
    ///   - initialOffset: 시작 지점 뷰와 배열의 첫 번째 뷰 사이의 수직 간격입니다. 기본값은 -10입니다.
    ///                    이 값이 -10일 경우 `verticalSpacing` 값이 사용되며, 그렇지 않으면 이 값이 첫 번째 뷰의 상단 마진으로 사용됩니다.
    ///   - verticalSpacing: 배열된 뷰들 사이의 기본 수직 간격입니다. 첫 번째 뷰와 `startingBelow` 뷰 사이에 `initialOffset`이 적용된 후,
    ///                      이후 뷰들은 이 간격을 사용하여 서로 배치됩니다.
    ///
    /// - Note: 마지막 뷰의 `bottom` 앵커는 슈퍼뷰와 동일하게 설정됩니다.
    static func layoutViewsSequentially(
        _ views: [UIView],
        startingBelow view: UIView,
        initialOffset: CGFloat = -10,
        verticalSpacing: CGFloat = 10
    ) {
        guard let firstView = views.first else { return }
        
        var previousView = view
        let initialSpacing = initialOffset == -10 ? verticalSpacing : initialOffset
        
        views.forEach { currentView in
            currentView.snp.makeConstraints { make in
                make.top.equalTo(previousView.snp.bottom).offset(previousView == view ? initialSpacing : verticalSpacing)
                make.left.right.equalToSuperview()
                
                // 마지막 뷰일 경우 contentView의 bottom과의 관계도 설정
                if currentView == views.last {
                    make.bottom.equalToSuperview().priority(.high) // priority를 조정하여 충돌을 방지
                }
            }
            previousView = currentView
        }
    }
    
    /// UIScrollView와 내부 contentView의 기본 레이아웃을 설정합니다.
    ///
    /// - Parameters:
    ///   - scrollView: 레이아웃을 설정할 ScrollView입니다.
    ///
    /// - Warning: 수직 스크롤입니다.
    /// - Note: heiracy는 따로 설정해두어야 합니다.
    static func layoutScrollView(
        _ scrollView: BaseScrollView
    ) {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        scrollView.contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
        }
    }

}
