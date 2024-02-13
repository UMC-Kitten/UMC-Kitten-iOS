//
//  AppDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/11/24.
//

import UIKit

import KakaoSDKAuth
import NaverThirdPartyLogin

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // Kakao auth setting
        KakaoAuthHelper.initializeKakaoAuthSdk()
        
        // Naver auth setting
        NaverAuthHelper.initializeNaverAuthSdk()
        
        // Temp token setting
        UserDefaults.standard.setValue("eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJnZW50bGU5ODI4QG5hdmVyLmNvbSIsInJvbGUiOiJST0xFX0FETUlOIiwiaWF0IjoxNzA3ODI3OTAxLCJleHAiOjE3MDc4MzE1MDF9.QhM6xkYDjo6_wBivLDs9mJ2Dui9alsP4jVqs6tBadS0I7Tf6XL3J_pqkMETo3OQ-kQz2MkXM2vSDAvmTzmj4oQ", forKey: UserDefaultsConstant.JWT_KEY)
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

}


