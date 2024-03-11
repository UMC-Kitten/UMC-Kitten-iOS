//
//  RegisteredPetsSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import KittenCommonUI

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
        
        let pageLayout = {
            let layout = PageCollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            layout.itemSize = CGSize(
                width: UIScreen.main.bounds.width - HomeConstant.HOME_PAGE_PADDING * 2 - CELL_RIGHT_MARGIN,
                height: 100
            )
            layout.minimumLineSpacing = 10
            return layout
        }()
        collectionView.collectionViewLayout = pageLayout
        collectionView.isPagingEnabled = false // 대신 flowlayout으로 pageing 구현
        collectionView.decelerationRate = .fast // 원하는 offset 까지 빠르게 이동하도록
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
            $0.left.right.equalToSuperview().inset(HomeConstant.HOME_PAGE_PADDING)
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

/// CollectionView에 page 적용 시 cell을 center에 맞추기 위한 FlowLayout
class PageCollectionViewFlowLayout: UICollectionViewFlowLayout {

    private var previousOffset: CGFloat = 0
    private var currentPage: Int = 0

    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }

        let itemsCount = collectionView.numberOfItems(inSection: 0)

        // Imitating paging behaviour
        // Check previous offset and scroll direction
        if previousOffset > collectionView.contentOffset.x && velocity.x < 0 {
            currentPage = max(currentPage - 1, 0)
        } else if previousOffset < collectionView.contentOffset.x && velocity.x > 0 {
            currentPage = min(currentPage + 1, itemsCount - 1)
        }

        // Update offset by using item size + spacing
        let updatedOffset = (itemSize.width + minimumInteritemSpacing) * CGFloat(currentPage)
        previousOffset = updatedOffset
    

        return CGPoint(x: updatedOffset, y: proposedContentOffset.y)
    }
}
