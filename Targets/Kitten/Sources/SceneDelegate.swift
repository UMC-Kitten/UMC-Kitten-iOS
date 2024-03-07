//
//  SceneDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/11/24.
//

import UIKit

import KittenUI
import KittenUtil

import Moya
import NaverThirdPartyLogin
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        print(#function)
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        NaverThirdPartyLoginConnection.getSharedInstance().delegate = self
        
        window = UIWindow(windowScene: windowScene)
        
        window?.rootViewController = TabBarController()
        window?.makeKeyAndVisible()
        
        if (!checkLogin()) {
            goLanding()
        }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    // MARK: SNS Login Deep Link
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            // Kakao auth
            if (AuthApi.isKakaoTalkLoginUrl(url)) {
                _ = AuthController.handleOpenUrl(url: url)
            }
            
            // Naver auth
            if url.absoluteString.hasPrefix("naverq4yYq9GqZvWRQnbf8S1h") {
                NaverThirdPartyLoginConnection
                    .getSharedInstance()
                    .receiveAccessToken(url)
            }
            
            // 소셜 로그인 후 로그인 재개 시 (deeplink: "kitten://login/resume")
            if url.absoluteString.hasPrefix("kitten") && url.host == "login" && url.path == "/resume" {
                let vc = MakeStoryboardVC.make("SignUp", "SIGNUP")
                let navVC = UINavigationController()
                navVC.viewControllers = [vc]
                navVC.modalPresentationStyle = .fullScreen
                
                window?.rootViewController?.dismiss(animated: false)
                window?.rootViewController?.present(navVC, animated: true, completion: nil)
            }
        }
    }
}

extension SceneDelegate {
    func checkLogin() -> Bool {
        let userId = UserDefaults.standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY)
        return true // FIXME: 
        return userId == 0 ? false : true
    }
    
    func goLanding() { 
        let landingNavVC = UINavigationController()
        let landingVC = MakeStoryboardVC.make("StartScreen", "STARTSCREEN")
        landingNavVC.viewControllers = [landingVC]
        landingNavVC.modalPresentationStyle = .fullScreen

        window?.rootViewController?.present(landingNavVC, animated: true, completion: nil)
    }
}
