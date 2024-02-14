//
//  CommunityPostView.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/14/24.
//

import UIKit
import SnapKit

class CommunityPostView: UIView {

    // MARK: - 프로퍼티
    private let postImageLabel: UILabel = {
        let label = UILabel()
        label.text = "게시글 사진"
        label.textColor = .black
        label.setDefaultFont(size: 16, weight: .semiBold)
        return label
    }()
    
    let contentImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .yellow
        imageView.layer.shadowOffset = CGSize(width: 6, height: 6)
        imageView.layer.shadowOpacity = 0.2
        imageView.layer.shadowRadius = 10
        return imageView
    }()
    
    // MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 메소드
    private func setConstraints() {
        self.addSubview(postImageLabel)
        self.addSubview(contentImageView)
        
        postImageLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(21)
            $0.leading.equalToSuperview().offset(46)
        }
        
        contentImageView.snp.makeConstraints {
            $0.top.equalTo(postImageLabel.snp.bottom).offset(16)
            $0.leading.trailing.equalToSuperview().inset(46)
            $0.height.equalTo(contentImageView.snp.width)
        }
    }
}
