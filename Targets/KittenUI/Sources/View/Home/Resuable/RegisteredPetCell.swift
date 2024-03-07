//
//  RegisteredPetsCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit
import SnapKit

import KittenUtil

class RegisteredPetCell: BaseCollectionViewCell {
    
    // MARK: Constant
    private let IMAGE_SIZE: CGFloat = 70
    
    // MARK: UI Component
    private let petImageView: UIImageView = .init(imageName: "cat-sample") // FIXME: loading 이미지로 바꾸기
    private let petNameLabel: UILabel = .init()
    private let petInfoLabel: UILabel = .init()
    let detailButton: UIButton = .init(image: UIImage(systemName: "arrow.forward")!)
    
    // MARK: Set Methods
    override func setStyle() {
        addShadowWithRoundedCorners()
        layer.borderColor = UIColor.grayScale200.cgColor
        layer.borderWidth = 1
        
        petImageView.layer.cornerRadius = IMAGE_SIZE / 2
        
        petNameLabel.setDefaultFont(size: 18, weight: .bold)
        petNameLabel.textColor = .black
        
        petInfoLabel.setDefaultFont(size: 16, weight: .regular)
        petInfoLabel.textColor = .grayScale600
        
        detailButton.imageView?.tintColor = .black
    }
    
    override func setHierarchy() {
        [petImageView, petNameLabel, petInfoLabel, detailButton]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        
        petImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
            $0.centerY.equalToSuperview()
            $0.width.height.equalTo(IMAGE_SIZE)
        }
        
        petNameLabel.snp.makeConstraints {
            $0.leading.equalTo(petImageView.snp.trailing).offset(15)
            $0.centerY.equalToSuperview().offset(-10)
        }
        
        petInfoLabel.snp.makeConstraints {
            $0.leading.equalTo(petImageView.snp.trailing).offset(15)
            $0.centerY.equalToSuperview().offset(12)
        }
        
        detailButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(10)
            $0.width.height.equalTo(20)
            $0.centerY.equalToSuperview()
        }
    }

    func configure(
        petImageName: String,
        petName: String,
        petInfo: String
    ) {
        ImageProvider.loadImage(petImageName) { image in
            DispatchQueue.main.async {
                self.petImageView.image = image
            }
        }
        self.petNameLabel.text = petName
        self.petInfoLabel.text = petInfo
    }
}
