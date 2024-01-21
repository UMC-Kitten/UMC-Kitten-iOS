//
//  ProfileImage.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import Foundation
import UIKit

class ProfileImageSection: BaseView {
    
    // MARK: Constant
    private let profileImageSize: CGFloat = 110
    
    // MARK: UI Component
    
    let profileImage: UIImageView = .init(imageName: "cat-sample")
    let editButton: UIImageView = .init(imageName: "edit-icon")
    
    // MARK: Set Method
    
    override func setStyle() { 
        profileImage.layer.cornerRadius = profileImageSize / 2
        profileImage.layer.masksToBounds = true
    }
    
    override func setHierarchy() { 
        [profileImage, editButton]
            .forEach { self.addSubview($0) }
    }
    
    override func setLayout() { 
        profileImage.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(35)
            $0.width.height.equalTo(profileImageSize)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(profileImage.snp.bottom).offset(-20)
            $0.trailing.equalTo(profileImage.snp.trailing).offset(-5)
            $0.width.height.equalTo(30)
        }
    }
    
}
