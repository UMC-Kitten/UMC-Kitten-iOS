//
//  MyPetCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/18/24.
//

import Foundation
import UIKit

import SnapKit

class MyPetCell: BaseView {
    
    // MARK: UI Component
    
    private let petImageView: UIImageView = .init(imageName: "")
    private let petNameLabel: UILabel = .init()
    private let petInfoLabel: UILabel = .init()
    
    // MARK: Constructor
    
    convenience init(
        petImageName: String = "cat-sample",
        petName: String,
        petInfo: String
    ) {
        self.init()
        self.petImageView.image = UIImage(named: petImageName)
        self.petNameLabel.text = petName
        self.petInfoLabel.text = petInfo
    }
    
    // MARK: Set Methods
    
    override func setStyle() {
        addShadowWithRoundedCorners()
        
        petNameLabel.setDefaultFont(size: 14, weight: .semiBold)
        petNameLabel.textColor = .white
        
        petInfoLabel.setDefaultFont(size: 11, weight: .regular)
        petInfoLabel.textColor = .white
    }
    
    override func setHierarchy() {
        [petImageView, petNameLabel, petInfoLabel]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        
        self.snp.makeConstraints {
            $0.width.equalTo(100)
            $0.height.equalTo(120)
        }
        
        petImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        petNameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(25)
        }
        
        petInfoLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        petImageView.addOverlayGradientLayer()
    }
    
    
    
}
