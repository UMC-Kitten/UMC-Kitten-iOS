//
//  FreeBoardDetailContentTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/1/24.
//

import UIKit
import SnapKit
//import ImageSlideshow

protocol ContentCellDelegate: AnyObject {
    func didTapMoreButton()
}

class FreeBoardDetailContentTableViewCell: UITableViewCell {

    // MARK: - 프로퍼티
    var contentCellDelegate: ContentCellDelegate?
    
    private let nicknameImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        return image
    }()
    
    let nicknameLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 18, weight: .semiBold)
        return label
    }()
    
    let uploadDateLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 11, weight: .regular)
        label.textColor = UIColor(red: 0.403, green: 0.403, blue: 0.403, alpha: 1)
        return label
    }()
    
    private lazy var userProfileInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nicknameImage, nicknameLabel, uploadDateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 6
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        return stackView
    }()
    
    private let moreInformationButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "ellipsis"), for: .normal)
        button.tintColor = .black
        button.isEnabled = true
        return button
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 14, weight: .semiBold)
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 13, weight: .regular)
        return label
    }()
    
    private let contentImageSlideshow: ImageSlideshow = {
        let imageSlideshow = ImageSlideshow(frame: .zero)
        return imageSlideshow
    }()
    
    private let heartImage: UIImageView = {
        let image = UIImageView(image: .boardHeart)
        return image
    }()
    
    let heartCountLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 12, weight: .light)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0.949, green: 0.306, blue: 0.118, alpha: 1)
        return label
    }()
    
    private let commentImage: UIImageView = {
        let image = UIImageView(image: .boardComment)
        return image
    }()
    
    let commentCountLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 12, weight: .light)
        label.numberOfLines = 1
        label.textColor = UIColor(red: 0.921, green: 0.735, blue: 0.257, alpha: 1)
        return label
    }()
    
    private lazy var heartStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartImage, heartCountLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var commentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [commentImage, commentCountLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()
    
    private lazy var heartCommentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartStackView, commentStackView])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()
    
    // MARK: - 생성자
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .white
        
        setConstraints()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 메소드
    private func setConstraints() {
        self.contentView.addSubview(userProfileInfoStackView)
        self.contentView.addSubview(moreInformationButton)
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(contentLabel)
        self.contentView.addSubview(contentImageSlideshow)
        self.contentView.addSubview(heartCommentStackView)
        
        userProfileInfoStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(24)
            $0.leading.equalToSuperview().offset(26)
        }
        
        moreInformationButton.snp.makeConstraints {
            $0.centerY.equalTo(userProfileInfoStackView.snp.centerY)
            $0.trailing.equalToSuperview().offset(-22)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(userProfileInfoStackView.snp.bottom).offset(12)
            $0.leading.equalTo(userProfileInfoStackView.snp.leading).offset(5)
        }
        
        contentLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(9)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        heartCommentStackView.snp.makeConstraints {
            $0.top.equalTo(contentLabel.snp.bottom).offset(15)
            $0.leading.equalTo(contentLabel.snp.leading)
            $0.bottom.equalToSuperview().offset(-10)
        }
    }
    
    private func setAddTarget() {
        self.moreInformationButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped() {
        contentCellDelegate?.didTapMoreButton()
    }
}
