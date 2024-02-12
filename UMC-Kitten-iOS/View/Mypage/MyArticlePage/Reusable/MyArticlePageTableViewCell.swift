//
//  MyArticlePageTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

class MyArticlePageTableViewCell: BaseTableViewCell {
    
    // MARK: Constant
    private let PROFILE_IMAGE_SIZE: CGFloat = 35
    
    // MARK: UI Container
    let reactionStackView: UIStackView = .init()
    
    // MARK: UI Component
    let userProfileImage: UIImageView = .init(imageName: "cat-sample")
    let userNickname: UILabel = .init(staticText: "고먐미")
    let detailIcon: UIImageView = .init(imageName: "detail-icon")
    let articleBody: UILabel = .init(staticText: "예시 본문입니다")
    let likeIcon: UIImageView = .init(imageName: "like-icon")
    let reactionCenterLine: UIView = .init()
    let chatIcon: UIImageView = .init(imageName: "chat-icon")
    let bottomLine: UIView = .init()
    
    // MARK: Initialization
    

    
    // MARK: UI Setup
    
    override func setStyle() { 
        self.selectionStyle = .none // 선택 배경색 없애기
        
        // container
        reactionStackView.axis = .horizontal
        reactionStackView.distribution = .equalSpacing
        
        // component
        userProfileImage.contentMode = .scaleAspectFill
        userProfileImage.clipsToBounds = true
        userProfileImage.layer.cornerRadius = PROFILE_IMAGE_SIZE / 2
        
        userNickname.setDefaultFont(size: 16, weight: .medium)
        
        articleBody.setDefaultFont(size: 15, weight: .regular)
        
        reactionCenterLine.backgroundColor = .grayScale200
        
        bottomLine.backgroundColor = .grayScale200
    }
    
    override func setHierarchy() { 
        [reactionStackView, userProfileImage, userNickname, detailIcon,
         articleBody,bottomLine]
            .forEach { self.addSubview($0) }
        
        [likeIcon, reactionCenterLine, chatIcon]
            .forEach { reactionStackView.addArrangedSubview($0) }
    }
    
    override func setLayout() { 
        userProfileImage.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.leading.equalToSuperview()
            $0.width.height.equalTo(PROFILE_IMAGE_SIZE)
        }
        
        userNickname.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.leading.equalTo(userProfileImage.snp.trailing).offset(10)
        }
        
        detailIcon.snp.makeConstraints {
            $0.top.equalToSuperview().offset(23)
            $0.trailing.equalToSuperview().inset(20)
            $0.height.equalTo(20)
        }
        
        articleBody.snp.makeConstraints {
            $0.top.equalTo(userProfileImage.snp.bottom).offset(10)
            $0.leading.equalToSuperview()
        }
        
        reactionStackView.snp.makeConstraints {
            $0.top.equalTo(articleBody.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview().inset(50)
            $0.height.equalTo(20)
        }
        
        likeIcon.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        reactionCenterLine.snp.makeConstraints {
            $0.width.equalTo(1)
        }
        
        chatIcon.snp.makeConstraints {
            $0.height.equalTo(20)
        }
        
        bottomLine.snp.makeConstraints {
            $0.top.equalTo(reactionStackView.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
}



