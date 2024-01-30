//
//  TapBarItem.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

class PageTapBarItem: BaseView {
    
    // MARK: UI Component
    private let titleLabel: UILabel = .init()
    private let border: UIView = .init()
    
    // MARK: Constructor
    convenience init(_ title: String) {
        self.init()
        self.titleLabel.text = title
    }
    
    // MARK: Set Methods
    override func setStyle() {
        border.backgroundColor = .mainDeep
        
        titleLabel.setDefaultFont(size: 16)
        titleLabel.textColor = .grayScale900
    }
    
    override func setHierarchy() {
        [titleLabel, border]
            .forEach { addSubview($0)}
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview().inset(3)
        }
        
        border.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(8)
            $0.bottom.leading.trailing.equalToSuperview()
            $0.height.equalTo(3)
        }
    }
    
    func configureUISelect() {
        titleLabel.textColor = .grayScale900
        border.backgroundColor = .mainDeep
    }
    
    func configureUIDeselect() {
        titleLabel.textColor = .grayScale600
        border.backgroundColor = .clear
    }
}
