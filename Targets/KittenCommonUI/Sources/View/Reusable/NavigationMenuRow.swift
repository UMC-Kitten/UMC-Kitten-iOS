//
//  NavigationMenuRow.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/17/24.
//

import UIKit

public class NavigationMenuRow: BaseView {
    
    // MARK: UI Containers
    
    private let rowContainer: UIStackView = .init()
    
    // MARK: UI Component
    private let border: UIView = .init()
    private let menuTitleLabel: UILabel = .init()
    private let arrowImage: UIImageView = .init(imageName: "arrow-right-gray")
    
    // MARK: Constructor
    
    public convenience init(_ menuTitle: String) {
        self.init()
        self.menuTitleLabel.text = menuTitle
    }
    
    // MARK: Set Methods
    
    public override func setStyle() {
        border.backgroundColor = .grayScale50
        
        rowContainer.distribution = .equalSpacing
        
        menuTitleLabel.setDefaultFont(size: 16)
        menuTitleLabel.textColor = .grayScale900
        
    }
    
    public override func setHierarchy() {
        [border, rowContainer]
            .forEach { addSubview($0)}
        
        [menuTitleLabel, arrowImage]
            .forEach { rowContainer.addArrangedSubview($0) }
    }
    
    public override func setLayout() {
        border.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        rowContainer.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        arrowImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.width.equalTo(20)
            $0.height.equalTo(20)
        }
    }
}
