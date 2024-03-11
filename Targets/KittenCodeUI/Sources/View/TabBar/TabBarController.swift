//
//  TabBarController.swift
//  Kitten
//
//  Created by DOYEON LEE on 3/7/24.
//  Copyright © 2024 tuist.io. All rights reserved.
//

import UIKit

import KittenStoryboardUI
import KittenAsset

public final class TabBarController: UITabBarController {

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // (1) VC 생성
        let homeVC = HomeViewController()
        let homeNavVC = UINavigationController(rootViewController: homeVC)
        
        let checkinVC = MakeStoryboardVC.make("HealthBook", "HEALTHBOOK")
        let checkinNavVC = UINavigationController(rootViewController: checkinVC)
        
        let communityVC = CommunityViewController()
        let communityNavVC = UINavigationController(rootViewController: communityVC)
        
        let mypageVC = MypageViewController()
        let mypageNavVC = UINavigationController(rootViewController: mypageVC)
        
        // (2) Tab Bar 이름 설정
        homeVC.title = "홈"
        checkinVC.title = "체크인"
        communityVC.title = "커뮤니티"
        mypageVC.title = "마이페이지"
        
        // (3) Tab Bar로 사용하기 위한 뷰 컨트롤러들 설정
        setViewControllers([homeNavVC, checkinNavVC, communityNavVC, mypageNavVC], animated: false)
        tabBar.backgroundColor = .white
        tabBar.tintColor = .main
        
        // (4) Tab Bar 이미지 설정
        guard let items = tabBar.items else { return }
        items[0].image = KittenAssetImages(name: "home-icon").image
        items[1].image = KittenAssetImages(name: "checkin-icon").image
        items[2].image = KittenAssetImages(name: "community-icon").image
        items[3].image = KittenAssetImages(name: "mypage-icon").image
    }
}
