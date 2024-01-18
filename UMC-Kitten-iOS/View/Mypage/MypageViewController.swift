//
//  MypageViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/15/24.
//

import UIKit

import SnapKit

class MypageViewController: BaseViewController {
    
    // MARK: UI Container
    let scrollView = UIScrollView()
    let contentView = UIView()
    
    // MARK: UI Component
    let profileSection = ProfileSection()
    let mypageMenuSection = MypageMenuSection()
    let versionLabel: UILabel = .init(text: "앱버전 1.0.0")
    
    // MARK: Set Properties
    
    override func setStyle() {
        scrollView.backgroundColor = .white
        
        contentView.backgroundColor = .white
        
        versionLabel.setDefaultFont(size: 11)
        versionLabel.textColor = .grayScale500
    }
    
    override func setDelegate() {
        
    }
    
    override func setHierarchy() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [profileSection, mypageMenuSection, versionLabel]
            .forEach { contentView.addSubview($0) }
        
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
            $0.height.equalTo(900) // Set your desired content height
        }
        
        profileSection.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
        mypageMenuSection.snp.makeConstraints {
            $0.top.equalTo(profileSection.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(mypageMenuSection.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
    }
    
    override func setBind() {
        
    }
    
}
