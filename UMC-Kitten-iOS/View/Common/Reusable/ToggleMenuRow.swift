//
//  ToggleMenuRow.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation

import Foundation
import UIKit

class ToggleMenuRow: BaseView {
    
    // MARK: UI Containers
    private let rowContainer: UIStackView = .init()
    
    // MARK: UI Component
    private let border: UIView = .init()
    private let menuTitleLabel: UILabel = .init()
    private let toggleSwitch: UISwitch = .init()
    
    // MARK: Constructor
    convenience init(_ menuTitle: String) {
        self.init()
        self.menuTitleLabel.text = menuTitle
    }
    
    // MARK: Set Methods
    override func setStyle() {
        border.backgroundColor = .grayScale50
        
        rowContainer.distribution = .equalSpacing
        
        menuTitleLabel.setDefaultFont(size: 16)
        menuTitleLabel.textColor = .grayScale900
        
        toggleSwitch.onTintColor = .secondary
        
    }
    
    override func setHierarchy() {
        [border, rowContainer]
            .forEach { addSubview($0)}
        
        [menuTitleLabel, toggleSwitch]
            .forEach { rowContainer.addArrangedSubview($0) }
    }
    
    override func setLayout() {
        border.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }
        
        rowContainer.snp.makeConstraints {
            $0.top.bottom.equalToSuperview().inset(15)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
        
        toggleSwitch.snp.makeConstraints {
            $0.centerY.equalToSuperview()
        }
    }
}
