//
//  Profile.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/17/24.
//

import UIKit

class ProfileSection: BaseView {
    
    // MARK: Data
    
    var ownerName: String = "임시 닉네임" {
        didSet {
            ownerNameLabel.text = ownerName
        }
    }
    
    // MARK: UI Component
    
    private let profileImageView: UIImageView = .init(imageName: "cat-sample")
    private let ownerNameLabel: UILabel = .init(text: "임시 닉네임")
    private let ownerRoleLabel: UILabel = .init(text: "반려인")
    private let myPetsInfoTitleLabel: UILabel = .init(text: "내 반려동물 정보")
    private let managementButton: UILabel = .init(text: "관리")
    
    // MARK: Set Methods
    
    override func setStyle() {
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        
        ownerNameLabel.setDefaultFont(size: 20, weight: .semiBold)
        
        ownerRoleLabel.setDefaultFont(size: 14)
        
        myPetsInfoTitleLabel.setDefaultFont(size: 14)
        myPetsInfoTitleLabel.textColor = .grayScale700
        
        managementButton.setDefaultFont(size: 16)
        managementButton.textColor = .grayScale800
        
    }
    
    override func setHierarchy() {
        [profileImageView, ownerNameLabel, ownerRoleLabel,
         myPetsInfoTitleLabel, managementButton]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() { 
        profileImageView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview()
            $0.size.equalTo(60)
        }
        
        ownerNameLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top).offset(5)
            $0.leading.equalTo(profileImageView.snp.trailing).offset(12)
        }
        
        ownerRoleLabel.snp.makeConstraints {
            $0.top.equalTo(ownerNameLabel.snp.bottom).offset(5)
            $0.leading.equalTo(ownerNameLabel.snp.leading)
        }
        
        myPetsInfoTitleLabel.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.leading.equalToSuperview()
        }
        
        managementButton.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.bottom).offset(20)
            $0.trailing.equalToSuperview()
        }
    }
    
}
