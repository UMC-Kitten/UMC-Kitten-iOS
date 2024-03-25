//
//  MoreButton.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/8/24.
//

import UIKit

import KittenAsset

public class MoreButton: BaseView {
    
    // MARK: UI Container
    private let stackView: UIStackView = .init()
    
    // MARK: UI Component
    private let moreLabel: UILabel = .init(staticText: "더보기")
    private let imageView: UIImageView = .init(imageName: "arrow-right-black")
    
    
    // MARK: Set Methods
    public override func setStyle() {
        stackView.axis = .horizontal
        stackView.spacing = 0
        stackView.alignment = .center
        stackView.distribution = .fillProportionally
        
        moreLabel.setDefaultFont(size: 14)
        moreLabel.textColor = .grayScale700
        
        imageView.alpha = 0.5
        imageView.contentMode = .scaleAspectFit
    }
    
    public override func setHierarchy() {
        [stackView]
            .forEach { self.addSubview($0) }
        
        [moreLabel, imageView]
            .forEach { stackView.addArrangedSubview($0) }
    }
    
    public override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(13)
        }
    }
    
}

