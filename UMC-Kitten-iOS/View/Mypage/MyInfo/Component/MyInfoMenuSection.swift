//
//  MyInfoMenuSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import Foundation
import UIKit

class MyInfoMenuSection: BaseView {
    
    // MARK: UI Containers
    
    private let menuStackView: UIStackView = .init()
    
    // MARK: UI Component
    
    private let firstSectionBorder: UIView = .init()
    let editNickName: NavigationMenuRow = .init("닉네임 설정")
    let editOwner: NavigationMenuRow = .init("반려인 설정")
    let marketingConsent: ToggleMenuRow = .init("마케팅 수신 동의")
    
    
    // MARK: Set Methods
    
    override func setStyle() {
        menuStackView.axis = .vertical
        
        firstSectionBorder.backgroundColor = .grayScale50
        
    }
    
    override func setHierarchy() {
        [menuStackView]
            .forEach { addSubview($0)}
        
        [firstSectionBorder, editNickName, editOwner, marketingConsent]
            .forEach { menuStackView.addArrangedSubview($0) }
        
    }
    
    override func setLayout() {
        menuStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        firstSectionBorder.snp.makeConstraints{
            $0.height.equalTo(10)
        }
    }
    
}
