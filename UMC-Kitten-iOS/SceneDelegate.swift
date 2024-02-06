//
//  SceneDelegate.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)

        // Tab Bar 컨트롤러 생성
        let tabBarVC = UITabBarController()
        
        // (1) VC 생성
         let homeVC = UIViewController()
         let checkinVC = UIViewController()
         let communityVC = UIViewController()
         let mypageVC = MypageViewController()
         let mypageNavVC = UINavigationController()
        mypageNavVC.viewControllers = [mypageVC]
        
        // (2) Tab Bar 이름 설정
        homeVC.title = "홈"
        checkinVC.title = "체크인"
        communityVC.title = "커뮤니티"
        mypageVC.title = "마이페이지"
        
        // (3) Tab Bar로 사용하기 위한 뷰 컨트롤러들 설정
        tabBarVC.setViewControllers([homeVC, checkinVC, communityVC, mypageNavVC], animated: false)
        tabBarVC.modalPresentationStyle = .fullScreen
        tabBarVC.tabBar.backgroundColor = .white
        tabBarVC.tabBar.tintColor = .mainDeep
        
        // (4) Tab Bar 이미지 설정
        guard let items = tabBarVC.tabBar.items else { return }
         items[0].image = UIImage(named: "home-icon")
         items[1].image = UIImage(named: "checkin-icon")
         items[2].image = UIImage(named: "community-icon")
         items[3].image = UIImage(named: "mypage-icon")
        
        // 기본 루트뷰를 탭바컨트롤러로 설정
        window?.rootViewController = tabBarVC
        window?.makeKeyAndVisible()
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


}

