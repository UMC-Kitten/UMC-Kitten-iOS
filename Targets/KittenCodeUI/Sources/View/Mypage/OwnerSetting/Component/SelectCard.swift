//
//  SelectCard.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

import KittenCommonUI
import KittenUtil

public class SelectCard: BaseView, SelectionItemProtocol {
    
    private var selectImage: UIImage = .init()
    private var deselectImage: UIImage = .init()

    // MARK: UI Component
    private let stackView: UIStackView = .init()
    private let imageView: UIImageView = .init()
    private let descriptionLabel: UILabel = .init(staticText: "샘플")

    // MARK: Initialization
    public convenience init(
        selectImageName: String,
        deselectImageName: String,
        description: String
    ) {
        self.init()
        
        ImageProvider.loadImage(selectImageName) { selectImage in
            if let selectImage = selectImage {
                self.selectImage = selectImage
            }
        }
        
        ImageProvider.loadImage(deselectImageName) { deselectImage in
            if let deselectImage = deselectImage {
                self.deselectImage = deselectImage
            }
        }
        
        self.descriptionLabel.text = description
    }

    // MARK: Set Method
    public override func setStyle() {

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

    public override func setHierarchy() {
        [stackView]
            .forEach { self.addSubview($0) }

        [imageView, descriptionLabel]
            .forEach { stackView.addArrangedSubview($0) }
    }

    public override func setLayout() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(20)
        }

        imageView.snp.makeConstraints {
            $0.height.equalTo(100)
        }
    }
    
    public func configureSelectUI() {
        self.imageView.image = selectImage
        self.descriptionLabel.textColor = .white
        self.backgroundColor = .main
    }
    
    public func configureDeselectUI() {
        self.imageView.image = deselectImage
        self.descriptionLabel.textColor = .black
        self.backgroundColor = .white
    }
    
    
}
