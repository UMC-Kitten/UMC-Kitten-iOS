//
//  MyPetCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/18/24.
//

import Foundation
import UIKit

import KittenUtil

import SnapKit

class MyPetCard: BaseView {
    
    // MARK: Constant
    static let CELL_WIDTH: CGFloat = 100
    static let CELL_HEIGHT: CGFloat = 120
    
    // MARK: UI Component
    
    private let petImageView: UIImageView = .init()
    private let petNameLabel: UILabel = .init()
    private let petInfoLabel: UILabel = .init()
    
    // MARK: Constructor
    
    convenience init(
        petImageName: String,
        petName: String,
        petInfo: String
    ) {
        self.init()
        ImageProvider.loadImage(petImageName) { image in
            DispatchQueue.main.async {
                self.petImageView.image = image
            }
        }
        self.petNameLabel.text = petName
        self.petInfoLabel.text = petInfo
    }
    
    // MARK: Set Methods
    
    override func setStyle() {
        addShadowWithRoundedCorners()
        
        petImageView.contentMode = .scaleAspectFill
        
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
            $0.width.equalTo(MyPetCard.CELL_WIDTH)
            $0.height.equalTo(MyPetCard.CELL_HEIGHT)
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
