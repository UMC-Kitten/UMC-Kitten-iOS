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
        UserDefaults.standard.setValue("eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJcYmRvODM0M0BuYXZlci5jb20iLCJyb2xlIjoiUk9MRV9BRE1JTiIsImlhdCI6MTcwODA4NjQ3OSwiZXhwIjoxNzA4MTcyODc5fQ.SetOfFzZSHxyrF78OG7UU0L9wWHS-4JYFmZ_j9cC9f_ZcpBsJb_b0oFBJXJlSjpJhpOEvnlM7u2XgmGYKzyOEg", forKey: UserDefaultsConstant.JWT_KEY)
//        UserDefaults.standard.setValue("0", forKey: UserDefaultsConstant.USER_ID_KEY)
        UserDefaults.standard.removeObject(forKey: UserDefaultsConstant.USER_ID_KEY)
        
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


