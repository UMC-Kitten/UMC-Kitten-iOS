//
//  PopularPostCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import KittenCommonUI

class PopularPostCell: BaseCollectionViewCell {
    
    // MARK: Constant
    private let IMAGE_SIZE: CGFloat = 70
    
    // MARK: UI Container
    private let postInfoStackView: UIStackView = .init()
    
    // MARK: UI Component
    private let boardName: UILabel = .init()
    private let postTitle: UILabel = .init()
    private let heartIcon: UIImageView = .init(imageName: "heart-icon-red")
    private let heartCount: UILabel = .init()
    private let commentIcon: UIImageView = .init(imageName: "comment-icon-yellow")
    private let commentCount: UILabel = .init()
    private let postInfo: UILabel = .init()
    
    // MARK: Set Methods
    override func setStyle() {
        // container
        postInfoStackView.spacing = 5
        
        // component
        addShadowWithRoundedCorners()
        layer.borderColor = UIColor.grayScale200.cgColor
        layer.borderWidth = 1
        
        boardName.setDefaultFont(size: 14, weight: .semiBold)
        boardName.textColor = .black
        
        postTitle.setDefaultFont(size: 16, weight: .regular)
        postTitle.textColor = .black
        
        heartCount.setDefaultFont(size: 12, weight: .regular)
        heartCount.textColor =  UIColor(hex: "F24E1E")
        
        commentCount.setDefaultFont(size: 12, weight: .regular)
        commentCount.textColor = UIColor(hex: "EBBB42")
        
        postInfo.setDefaultFont(size: 12, weight: .regular)
        postInfo.textColor = .grayScale500
        
    }
    
    override func setHierarchy() {
        [boardName, postTitle, postInfoStackView]
            .forEach { addSubview($0)}
        
        
        [heartIcon, heartCount, commentIcon, commentCount, postInfo]
            .forEach { postInfoStackView.addArrangedSubview($0) }
    }
    
    override func setLayout() {
        
        boardName.snp.makeConstraints {
            $0.top.equalToSuperview().inset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        postTitle.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(20)
            $0.top.equalTo(boardName.snp.bottom).offset(5)
        }
        
        postInfoStackView.snp.makeConstraints {
            $0.top.equalTo(postTitle.snp.bottom).offset(10)
            $0.left.equalToSuperview().inset(20)
//            $0.bottom.equalToSuperview().inset(10)
        }
        
        heartIcon.snp.makeConstraints {
            $0.width.height.equalTo(15)
        }
        
        commentIcon.snp.makeConstraints {
            $0.width.height.equalTo(15)
        }
    }

    func configure(
        boardTitle: String,
        postTitle: String,
        heartCount: Int,
        commentCount: Int,
        postInfo: String
    ) {
        self.boardName.text = boardTitle
        self.postTitle.text = postTitle
        self.heartCount.text = "\(heartCount)"
        self.commentCount.text = "\(commentCount)"
        self.postInfo.text = postInfo
    }
}
