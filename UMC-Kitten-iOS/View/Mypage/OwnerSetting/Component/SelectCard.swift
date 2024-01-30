//
//  SelectCard.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

class SelectCard: BaseView {

    // MARK: UI Component
    private let stackView: UIStackView = .init()
    private let imageView: UIImageView = .init()
    private let descriptionLabel: UILabel = .init(text: "샘플")

    // MARK: Initialization
    convenience init(
        imageName: String = "cat-sample",
        description: String
    ) {
        self.init()
        self.imageView.image = UIImage(named: imageName)
        self.descriptionLabel.text = description
    }

    // MARK: Set Method
    override func setStyle() {

        layer.cornerRadius = 10
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.2
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = 5
        layer.backgroundColor = UIColor.white.cgColor

        imageView.contentMode = .scaleAspectFit

        descriptionLabel.setDefaultFont(size: 18, weight: .medium)
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textAlignment = .center

        stackView.axis = .vertical
        stackView.spacing = 10 // 조절 가능한 간격
    }

    override func setHierarchy() {
        [stackView]
            .forEach { self.addSubview($0) }

        [imageView, descriptionLabel]
            .forEach { stackView.addArrangedSubview($0) }
    }

    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
}
