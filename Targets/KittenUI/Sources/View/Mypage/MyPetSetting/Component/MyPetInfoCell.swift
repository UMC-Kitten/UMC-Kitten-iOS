//
//  MyPetCardCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

class MyPetInfoCell: BaseCollectionViewCell {
    
    // MARK: Data
    var petId: Int64 = 0
    private var isOverlayInitialized: Bool = false
    
    // MARK: UI Component
    private let petImageView: UIImageView = .init(imageName: "cat-sample") // FIXME: loading 이미지로 바꾸기
    private let petNameLabel: UILabel = .init()
    private let petInfoLabel: UILabel = .init()
    let deleteButton: UIButton = .init(image: UIImage(named: "delete-icon")!)
    
    // MARK: Set Methods
    override func setStyle() {
        addShadowWithRoundedCorners()
        
        petNameLabel.setDefaultFont(size: 16, weight: .semiBold)
        petNameLabel.textColor = .white
        
        petInfoLabel.setDefaultFont(size: 14, weight: .regular)
        petInfoLabel.textColor = .white
        
        deleteButton.alpha = 0.5
        
    }
    
    override func setHierarchy() {
        [petImageView, petNameLabel, petInfoLabel, deleteButton]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        
//        self.snp.makeConstraints {
//            $0.width.equalTo(100)
//            $0.height.equalTo(120)
//        }
        
        petImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.width.height.equalToSuperview()
        }
        
        petNameLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(30)
        }
        
        petInfoLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(10)
            $0.bottom.equalToSuperview().inset(10)
        }
        
        deleteButton.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(20)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if !isOverlayInitialized {
            petImageView.addOverlayGradientLayer()
            isOverlayInitialized = true
        }
    }

    func configure(
        petId: Int64,
        petImageName: String,
        petName: String,
        petInfo: String
    ) {
        self.petId = petId
        ImageProvider.loadImage(petImageName) { image in
            DispatchQueue.main.async {
                self.petImageView.image = image
            }
        }
        self.petNameLabel.text = petName
        self.petInfoLabel.text = petInfo
    }
}
