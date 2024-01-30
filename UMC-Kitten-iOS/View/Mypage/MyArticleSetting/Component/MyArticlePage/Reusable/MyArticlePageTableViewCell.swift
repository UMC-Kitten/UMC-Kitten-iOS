//
//  MyArticlePageTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

class MyTableViewCell: BaseTableViewCell {
    
    // MARK: Constant
    private let PROFILE_IMAGE_SIZE: CGFloat = 40
    
    // MARK: UI Components
    let userProfileImage: UIImageView = .init(imageName: "cat-sample")
    let userNickname: UILabel = .init(text: "고먐미")
    let articleBody: UILabel = .init(text: "예시 본문입니다")
    
    // MARK: Initialization

    
    // MARK: UI Setup
    
    override func setStyle() { 
        userProfileImage.contentMode = .scaleAspectFill
        userProfileImage.clipsToBounds = true
        userProfileImage.layer.cornerRadius = PROFILE_IMAGE_SIZE / 2
        
        userNickname.setDefaultFont(size: 16, weight: .semiBold)
        
        articleBody.setDefaultFont(size: 15, weight: .regular)
    }
    
    override func setHierarchy() { 
        [userProfileImage, userNickname, articleBody]
            .forEach { self.addSubview($0) }
    }
    
    override func setLayout() { 
        userProfileImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(PROFILE_IMAGE_SIZE)
        }
        
        userNickname.snp.makeConstraints {
            $0.top.equalToSuperview().inset(32)
            $0.leading.equalTo(userProfileImage.snp.trailing).offset(10)
        }
        
        articleBody.snp.makeConstraints {
            $0.top.equalTo(userProfileImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
            $0.bottom.equalToSuperview().inset(10)
        }
        
    }
}



