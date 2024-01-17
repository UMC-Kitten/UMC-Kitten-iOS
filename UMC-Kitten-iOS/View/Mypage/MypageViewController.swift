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

    // MARK: Set Properties

    override func setStyle() { 
        scrollView.backgroundColor = .white
        
        contentView.backgroundColor = .white
    }
    
    override func setDelegate() {

    }
    
    override func setHierarchy() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [profileSection, mypageMenuSection]
            .forEach { contentView.addSubview($0) }
        
    }
    
    override func setLayout() { 
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        contentView.snp.makeConstraints { make in
            make.edges.width.equalTo(scrollView)
            make.height.equalTo(2000) // Set your desired content height
        }
        
        profileSection.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.trailing.leading.equalToSuperview().inset(20)
            make.height.equalTo(200)
        }
        
        mypageMenuSection.snp.makeConstraints { make in
            make.top.equalTo(profileSection.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview()
        }

    }
    
    override func setBind() { 
        
    }

}
