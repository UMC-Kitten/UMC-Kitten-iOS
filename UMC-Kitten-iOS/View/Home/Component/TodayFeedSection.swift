//
//  TodayFeedSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/8/24.
//

import UIKit

import RxSwift

class TodayFeedSection: BaseView {
    
    // MARK: Constant
    private let CELL_RIGHT_MARGIN: CGFloat = 30
    
    // MARK: UI Component
    private let sectionTitle: UILabel = .init(text: "오늘의 피드")
    private let moreButton: MoreButton = .init()
    private let collectionView: BaseCollectionView = .init()
    private let selectionLine: UIView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        super.setStyle()
        
        sectionTitle.setDefaultFont(size: 20, weight: .bold)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.minimumLineSpacing = 10
            layout.itemSize = CGSize(
                width: UIScreen.main.bounds.width / 2 - HOME_PAGE_PADDING - layout.minimumLineSpacing,
                height: 220
            )
        }
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(TodayFeedCell.self, forCellWithReuseIdentifier: "cell")
        
        selectionLine.backgroundColor = .grayScale100
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        
        [sectionTitle, moreButton, collectionView, selectionLine]
            .forEach { addSubview($0) }

    }
    
    override func setLayout() {
        super.setLayout()
        
        sectionTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(25)
            $0.left.right.equalToSuperview().inset(HOME_PAGE_PADDING)
        }
        
        moreButton.snp.makeConstraints {
            $0.centerY.equalTo(sectionTitle.snp.centerY)
            $0.right.equalToSuperview().inset(HOME_PAGE_PADDING)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(sectionTitle.snp.bottom).offset(25)
            $0.left.right.equalToSuperview().inset(HOME_PAGE_PADDING)
            $0.height.equalTo(450)
        }
        
        selectionLine.snp.makeConstraints {
            $0.left.right.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setBind() {
        super.setBind()

        // FIXME: 예시 데이터
        let feeds = Observable.just([
            1, 2, 3, 4
        ])

        feeds.bind(to: collectionView.rx.items(
            cellIdentifier: "cell",
            cellType: TodayFeedCell.self)) { index, model, cell in
                cell.configure(
                    feedImageName: "cat-sample",
                    feedTitle: "오늘 저희 초코 OO샵에서 미용했어요!"
                )
        }
        .disposed(by: disposeBag)
    }
}

