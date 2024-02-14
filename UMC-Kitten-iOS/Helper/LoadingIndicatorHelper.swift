//
//  LoadingIndicatorHelper.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import UIKit

/// 화면 전체에 로딩 화면을 띄우거나 제거
final class LoadingIndicatorHelper {
    
    static func startLoading() {
        // 로딩 뷰 생성
        let loadingView = UIView(frame: rootController().view.bounds)
        loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        loadingView.tag = 999 // 로딩 뷰를 식별하기 위한 태그
        
        // 활동 표시기(스피너) 생성
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.center = loadingView.center
        activityIndicator.startAnimating()
        
        // 로딩 뷰에 활동 표시기 추가
        loadingView.addSubview(activityIndicator)
        
        // 메인 스레드에서 현재 뷰 컨트롤러의 뷰에 로딩 뷰 추가
        DispatchQueue.main.async {
            rootController().view.addSubview(loadingView)
        }
    }
    
    static func endLoading() {
        // 메인 스레드에서 로딩 뷰 제거
        DispatchQueue.main.async {
            if let loadingView = rootController().view.viewWithTag(999) {
                loadingView.removeFromSuperview()
            }
        }
    }
    
    private static func rootController() -> UIViewController {
        guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return .init()
        }
        
        guard let root = screen.windows.first?.rootViewController else {
            return .init()
        }
        
        return root
    }
}
