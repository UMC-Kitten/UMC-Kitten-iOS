//
//  RegisteredPetsSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import RxSwift
import RxCocoa

class RegisteredPetsSection: BaseView {
    
    // MARK: Constant
    /// 다음 셀이 살짝 보이게 하기 위한 마진
    private let CELL_RIGHT_MARGIN: CGFloat = 30
    
    // MARK: UI Component
    let collectionView: BaseCollectionView = .init()
    private let selectionLine: UIView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        super.setStyle()
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(
                width: UIScreen.main.bounds.width - HOME_PAGE_PADDING * 2 - CELL_RIGHT_MARGIN,
                height: 100
            )
            layout.minimumLineSpacing = 10
        }

        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(RegisteredPetCell.self, forCellWithReuseIdentifier: "cell")
        
        selectionLine.backgroundColor = .grayScale100
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        
        [collectionView, selectionLine]
            .forEach { addSubview($0) }
    }
    
    override func setLayout() {
        super.setLayout()
        
        collectionView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(10)
            $0.left.right.equalToSuperview().inset(HOME_PAGE_PADDING)
            $0.height.equalTo(100)
        }
        
        selectionLine.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview()
        }
    }
}
