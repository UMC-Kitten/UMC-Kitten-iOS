//
//  MoreButton.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/8/24.
//

import UIKit

class MoreButton: BaseView {
    
    // MARK: UI Container
    private let stackView: UIStackView = .init()
    
    // MARK: UI Component
    private let moreLabel: UILabel = .init(text: "더보기")
    private let imageView: UIImageView = .init(imageName: "arrow-right-black")
    
    
    // MARK: Set Methods
    override func setStyle() {
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        
        moreLabel.setDefaultFont(size: 14)
        moreLabel.textColor = .grayScale700
        
        imageView.alpha = 0.5
        imageView.contentMode = .scaleAspectFit
    }
    
    override func setHierarchy() {
        [stackView]
            .forEach { self.addSubview($0) }
        
        [moreLabel, imageView]
            .forEach { stackView.addArrangedSubview($0) }
    }
    
    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.width.height.equalTo(13)
        }
    }
    
}

