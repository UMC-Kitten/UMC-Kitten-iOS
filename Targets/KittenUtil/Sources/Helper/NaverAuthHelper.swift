//
//  NaverAuthService.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation
import NaverThirdPartyLogin

/// 네이버 로그인 SDK 관련 동작 모음
public class NaverAuthHelper{
    
    public init() {}
    
    /// 네이버 로그인 SDK를 초기화합니다.
    public static func initializeNaverAuthSdk() {
        // 네이버 앱으로 로그인 허용
        NaverThirdPartyLoginConnection.getSharedInstance()?.isNaverAppOauthEnable = true
        // 브라우저 로그인 허용
        NaverThirdPartyLoginConnection.getSharedInstance()?.isInAppOauthEnable = true
        
        // 네이버 로그인 세로모드 고정
        NaverThirdPartyLoginConnection.getSharedInstance().setOnlyPortraitSupportInIphone(true)
        
        // NaverThirdPartyConstantsForApp.h에 선언한 상수 등록
        NaverThirdPartyLoginConnection.getSharedInstance().serviceUrlScheme = kServiceAppUrlScheme
        NaverThirdPartyLoginConnection.getSharedInstance().consumerKey = kConsumerKey
        NaverThirdPartyLoginConnection.getSharedInstance().consumerSecret = kConsumerSecret
        NaverThirdPartyLoginConnection.getSharedInstance().appName = kServiceAppName
    }
    
    /// 네이버 로그인을 위해 네이버앱으로 이동합니다.
    ///
    /// 참고) 로그인 완료 후 처리는 SeneDelegate에서 딥링크로 처리합니다.
    public static func openNaverLogin() {
        if NaverThirdPartyLoginConnection
            .getSharedInstance()
            .isPossibleToOpenNaverApp() // Naver App이 깔려있는지 확인
        {
            NaverThirdPartyLoginConnection
                .getSharedInstance()
                .requestThirdPartyLogin()
        } else { // 네이버 앱 안깔려져 있을때
            // Appstore에서 네이버앱 열기
            NaverThirdPartyLoginConnection.getSharedInstance().openAppStoreForNaverApp()
        }
    }
}
