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
    
    // MARK: UI Container
    private let myPetsScrollView: UIScrollView = .init()
    private let myPetsContainer: UIStackView = .init()
    
    // MARK: UI Component
    
    let profileImageView: UIImageView = .init(imageName: "cat-sample")
    let ownerNameLabel: UILabel = .init(text: "임시 닉네임")
    let ownerRoleLabel: UILabel = .init(text: "반려인")
    
    private let myPetsInfoTitleLabel: UILabel = .init(text: "내 반려동물 정보")
    let managementButton: UILabel = .init(text: "관리")
    private let myPetCells: [MyPetCard] = [
        .init(petImageName: "cat-sample", petName: "무냥이", petInfo: "고양이/수컷"),
        .init(petImageName: "cat-sample", petName: "무냥이", petInfo: "고양이/수컷")
    ]
    
    // MARK: Set Method
    
    override func setStyle() {
        profileImageView.layer.cornerRadius = 30
        profileImageView.layer.masksToBounds = true
        
        ownerNameLabel.setDefaultFont(size: 20, weight: .semiBold)
        
        ownerRoleLabel.setDefaultFont(size: 14)
        
        myPetsInfoTitleLabel.setDefaultFont(size: 14)
        myPetsInfoTitleLabel.textColor = .grayScale700
        
        managementButton.setDefaultFont(size: 16, weight: .semiBold)
        managementButton.textColor = .main
        
        myPetsScrollView.showsHorizontalScrollIndicator = false
        
        myPetsContainer.axis = .horizontal
        myPetsContainer.spacing = 16
        
    }
    
    override func setHierarchy() {
        [profileImageView, ownerNameLabel, ownerRoleLabel,
         myPetsInfoTitleLabel, managementButton, myPetsScrollView]
            .forEach { addSubview($0)}
        
        [myPetsContainer]
            .forEach { myPetsScrollView.addSubview($0) }
        
        myPetCells.forEach { myPetsContainer.addArrangedSubview($0) }
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
        
        myPetsScrollView.snp.makeConstraints {
            $0.top.equalTo(myPetsInfoTitleLabel.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(120) // MyPetCell's height is 120
            $0.bottom.equalToSuperview()
        }
        
        myPetsContainer.snp.makeConstraints {
            if (myPetCells.count < 3) {
                $0.centerX.equalToSuperview()
            } else {
                $0.edges.equalToSuperview()
            }
            $0.height.equalToSuperview()
        }
    }
    
}
