//
//  SceneDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/11/24.
//

import UIKit

import Moya
import KakaoSDKAuth
import NaverThirdPartyLogin

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        NaverThirdPartyLoginConnection.getSharedInstance().delegate = self
        
        window = UIWindow(windowScene: windowScene)
        
        // Tab Bar 컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        // (1) VC 생성
        let homeVC = HomeViewController()
        let homeNavVC = UINavigationController()
        homeNavVC.viewControllers = [homeVC]
        
        //        let checkinVC = LoginTestViewController()
        let checkinStoryboard = UIStoryboard(name: "HealthBook", bundle: nil)
        guard let checkinVC = checkinStoryboard.instantiateViewController(withIdentifier: "HEALTHBOOK")
                as? HealthBookViewController
        else { fatalError("Unable to instantiate HealthBookViewController from the checkinStoryboard with identifier 'HEALTHBOOK'") }
        let checkinNavVC = UINavigationController()
        checkinNavVC.viewControllers = [checkinVC]
        
        let communityVC = CommunityViewController()
        let communityNavVC = UINavigationController()
        communityNavVC.viewControllers = [communityVC]
        
        let mypageVC = MypageViewController()
        let mypageNavVC = UINavigationController()
        mypageNavVC.viewControllers = [mypageVC]
        
        
        // (2) Tab Bar 이름 설정
        homeVC.title = "홈"
        checkinVC.title = "체크인"
        communityVC.title = "커뮤니티"
        mypageVC.title = "마이페이지"
        
        // (3) Tab Bar로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([homeNavVC, checkinNavVC, communityNavVC, mypageNavVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.tintColor = .main
        
        // (4) Tab Bar 이미지 설정
        guard let items = tabBarVC.tabBar.items else { return }
        items[0].image = UIImage(named: "home-icon")
        items[1].image = UIImage(named: "checkin-icon")
        items[2].image = UIImage(named: "community-icon")
        items[3].image = UIImage(named: "mypage-icon")
        
        // 기본 루트뷰를 탭바컨트롤러로 설정
        window?.rootViewController = tabBarVC
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
                let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
                guard let vc = storyboard.instantiateViewController(withIdentifier: "SIGNUP")
                        as? SignUpViewController
                else { fatalError("Unable to instantiate WelcomeViewController from the landingStoryboard with identifier 'SIGNUP'.") }
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
        return userId == 0 ? false : true
    }
    
    func goLanding() {
        let landingStoryboard = UIStoryboard(name: "StartScreen", bundle: nil)
        guard let landingVC = landingStoryboard.instantiateViewController(withIdentifier: "STARTSCREEN")
                as? StartScreenViewController
        else { fatalError("Unable to instantiate WelcomeViewController from the landingStoryboard with identifier 'STARTSCREEN'.") }
        let landingNavVC = UINavigationController()
        landingNavVC.viewControllers = [landingVC]
        landingNavVC.modalPresentationStyle = .fullScreen
        
        window?.rootViewController?.present(landingNavVC, animated: true, completion: nil)
    }
}

extension SceneDelegate {
    
}
