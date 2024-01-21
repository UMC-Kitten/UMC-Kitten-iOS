//
//  MypageMenuSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/17/24.
//

import Foundation
import UIKit

class MypageMenuSection: BaseView {
    
    // MARK: UI Containers
    
    private let menuStackView: UIStackView = .init()
    
    // MARK: UI Component
    
    private let firstSectionBorder: UIView = .init()
    let editMyProfile: MenuRow = .init("내정보 관리")
    let editMyArticle: MenuRow = .init("내 게시물 관리")
    let faq: MenuRow = .init("FAQ")
    let notice: MenuRow = .init("공지사항")
    
    private let secondSectionBorder: UIView = .init()
    let inquiry: MenuRow = .init("서비스 문의")
    let terms: MenuRow = .init("서비스 이용약관")
    
    
    // MARK: Set Methods
    
    override func setStyle() {
        menuStackView.axis = .vertical
        
        firstSectionBorder.backgroundColor = .grayScale50
        
        secondSectionBorder.backgroundColor = .grayScale50
        
    }
    
    override func setHierarchy() {
        [menuStackView]
            .forEach { addSubview($0)}
        
        [firstSectionBorder, editMyProfile, editMyArticle, faq, notice, 
         secondSectionBorder, inquiry, terms]
            .forEach { menuStackView.addArrangedSubview($0) }
        
    }
    
    override func setLayout() {
        menuStackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        firstSectionBorder.snp.makeConstraints{
            $0.height.equalTo(10)
        }
        
        secondSectionBorder.snp.makeConstraints{
            $0.height.equalTo(10)
        }
    }
    
}
