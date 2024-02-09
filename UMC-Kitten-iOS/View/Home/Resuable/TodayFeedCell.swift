//
//  TodayFeedCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/8/24.
//

import UIKit

class TodayFeedCell: BaseCollectionViewCell {
    
    // MARK: Constant
    private let IMAGE_SIZE: CGFloat = 70
    
    // MARK: UI Component
    private let feedImageView: UIImageView = .init(imageName: "cat-sample") // FIXME: loading 이미지로 바꾸기
    private let feedTitle: UILabel = .init()
    
    // MARK: Set Methods
    override func setStyle() {
        
        feedImageView.layer.cornerRadius = 10
        
        feedTitle.setDefaultFont(size: 16, weight: .regular)
        feedTitle.textColor = .black
        feedTitle.numberOfLines = 2
    }
    
    override func setHierarchy() {
        [feedImageView, feedTitle]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        
        feedImageView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.width.height.equalTo(UIScreen.main.bounds.width / 2 - HOME_PAGE_PADDING * 2)
            $0.centerX.equalToSuperview()
        }
        
        feedTitle.snp.makeConstraints {
            $0.top.equalTo(feedImageView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview()
        }

    }

    func configure(
        feedImageName: String,
        feedTitle: String
    ) {
        self.feedImageView.image = UIImage(named: feedImageName)
        self.feedTitle.text = feedTitle
    }
}
