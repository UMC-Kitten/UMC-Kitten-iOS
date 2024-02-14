//
//  FreeBoardTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/22/24.
//

import UIKit
import SnapKit

final class FreeBoardTableViewCell: UITableViewCell {
    
    // MARK: - 프로퍼티
    let titleLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 16, weight: .bold)
        label.numberOfLines = 1
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 14, weight: .regular)
        label.numberOfLines = 1
        return label
    }()
    
    let contentImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.circle")
        return image
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
    
    let uploadDateLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 12, weight: .light)
        label.numberOfLines = 1
        return label
    }()
    
    let userNameLabel: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 12, weight: .light)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var titleAndContentStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, contentLabel])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 5
        return stackView
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
    
    private lazy var additionalInfoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [heartStackView, commentStackView, uploadDateLabel, userNameLabel])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 6
        return stackView
    }()
    
    private lazy var summaryWithoutCommentImageStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleAndContentStackView, additionalInfoStackView])
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .leading
        stackView.spacing = 9
        return stackView
    }()
    
    private lazy var divisionLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        return view
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
        self.addSubview(summaryWithoutCommentImageStackView)
        self.addSubview(contentImage)
        self.addSubview(divisionLineView)
        
        summaryWithoutCommentImageStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(17)
            $0.leading.equalToSuperview().offset(34)
            $0.trailing.lessThanOrEqualTo(contentImage.snp.leading).offset(-10)
        }
        
        contentImage.snp.makeConstraints {
            $0.top.equalTo(summaryWithoutCommentImageStackView.snp.top)
            $0.leading.equalTo(summaryWithoutCommentImageStackView.snp.trailing)
            $0.trailing.equalToSuperview().offset(-27)
            $0.bottom.equalTo(summaryWithoutCommentImageStackView.snp.bottom)
            $0.width.equalTo(self.contentImage.snp.height)
        }
        
        divisionLineView.snp.makeConstraints {
            $0.top.equalTo(summaryWithoutCommentImageStackView.snp.bottom).offset(17)
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
}
