//
//  FreeBoardDetailCommentTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/1/24.
//

import UIKit
import SnapKit

final class FreeBoardDetailCommentTableViewCell: UITableViewCell {

    // MARK: - 프로퍼티
    private let divisionLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        return view
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
        let stackView = UIStackView(arrangedSubviews: [userImageView, userNameCommentStackView])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let heartImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "heart")
        image.tintColor = .black
        return image
    }()
    
    let heartCountLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 14, weight: .regular)
        return label
    }()
    
    private lazy var heartStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartImageView, heartCountLabel])
        stackView.axis = .vertical
        stackView.spacing = 0
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
        self.contentView.addSubview(divisionLineView)
        self.contentView.addSubview(userProfileCommentStackView)
        self.contentView.addSubview(heartStackView)
        
        divisionLineView.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(3)
        }
        
        userProfileCommentStackView.snp.makeConstraints {
            $0.top.equalTo(divisionLineView.snp.bottom).offset(14)
            $0.bottom.equalToSuperview().inset(14)
            $0.leading.equalToSuperview().offset(26)
        }
        
        heartStackView.snp.makeConstraints {
            $0.centerY.equalTo(userProfileCommentStackView.snp.centerY)
            $0.trailing.equalToSuperview().offset(-20)
        }
    }
}
