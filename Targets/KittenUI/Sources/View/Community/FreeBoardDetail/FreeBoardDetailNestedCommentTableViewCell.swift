//
//  FreeBoardDetailNestedCommentTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/1/24.
//

import UIKit
import SnapKit

class FreeBoardDetailNestedCommentTableViewCell: UITableViewCell {

    // MARK: - 프로퍼티
    private let nestedCommentArrowImageView: UIImageView = {
        let image = UIImageView(image: .nestedCommentArrow)
        return image
    }()
    
    private let userImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        return image
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 14, weight: .semiBold)
        return label
    }()
    
    let userCommentLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 13, weight:. regular)
        return label
    }()
    
    private lazy var userNameCommentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [userNameLabel, userCommentLabel])
        stackView.axis = .vertical
        stackView.spacing = 6
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private lazy var userProfileCommentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nestedCommentArrowImageView, userImageView, userNameCommentStackView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    // MARK: - 생성자
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - 메소드
    private func setConstraints() {
        self.contentView.addSubview(userProfileCommentStackView)
        
        userProfileCommentStackView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().offset(40)
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}
