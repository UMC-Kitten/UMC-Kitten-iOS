//
//  MyPetAddCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import UIKit

class MyPetAddCell: BaseCollectionViewCell {
    
    // MARK: UI Component
    let plusImage: UIImageView = .init(image: UIImage(systemName: "plus")!)
    
    // MARK: Set Methods
    override func setStyle() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.grayScale100.cgColor
        
        plusImage.tintColor = .main
        plusImage.contentMode = .scaleAspectFit
        
    }
    
    override func setHierarchy() {
        [plusImage]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        plusImage.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.height.width.equalTo(40)
        }
    }
}
