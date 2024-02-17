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
    let profileImageView: UIImageView = .init()
    let editButton: UIImageView = .init(imageName: "edit-icon")
    
    // MARK: Set Method
    override func setStyle() { 
        profileImageView.layer.cornerRadius = profileImageSize / 2
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.borderWidth = 2.0
        profileImageView.layer.borderColor = UIColor.main.withAlphaComponent(0.1).cgColor
        profileImageView.contentMode = .scaleAspectFill
    }
    
    override func setHierarchy() { 
        [profileImageView, editButton]
            .forEach { self.addSubview($0) }
    }
    
    override func setLayout() { 
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.bottom.equalToSuperview().inset(35)
            $0.width.height.equalTo(profileImageSize)
        }
        
        editButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(-20)
            $0.trailing.equalTo(profileImageView.snp.trailing).offset(-5)
            $0.width.height.equalTo(30)
        }
    }
    
}
