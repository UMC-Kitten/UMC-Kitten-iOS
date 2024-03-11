//
//  MyArticlePageTapBar.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

import KittenCommonUI

class MyArticlePageTapBar: BaseView {
    
    private var stackView: UIStackView = .init()
    
    var items: [PageTapBarItem] = [
        PageTapBarItem("자유게시판"),
        PageTapBarItem("자랑해요"),
        PageTapBarItem("리뷰해요"),
    ]
    
    override func setStyle() {
        stackView.spacing = 15
        stackView.distribution = .fill
        
        items[0].configureUISelect()
        items[1].configureUIDeselect()
        items[2].configureUIDeselect()
    }
    
    override func setHierarchy() { 
        [stackView]
            .forEach { self.addSubview($0) }
        
        items
            .forEach { stackView.addArrangedSubview($0) }
    }
    
    override func setLayout() {
        stackView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
    }
    
    /// 선택된 PageTapItem을 Select UI로 변경하고, 나머지를 Deselect UI로 변경합니다.
    func selectTapItem(_ index: Int) {
        items.enumerated().forEach { (i, item) in
            if i == index {
                item.configureUISelect()
            } else {
                item.configureUIDeselect()
            }
        }
    }
}
