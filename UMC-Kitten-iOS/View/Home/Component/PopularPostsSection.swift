//
//  PopularPostsSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import RxSwift

class PopularPostsSection: BaseView {
    
    // MARK: Constant
    private let CELL_RIGHT_MARGIN: CGFloat = 30
    
    // MARK: UI Component
    private let sectionTitle: UILabel = .init(text: "인기 게시글")
    private let collectionView: BaseCollectionView = .init()
    private let selectionLine: UIView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        super.setStyle()
        
        sectionTitle.setDefaultFont(size: 20, weight: .bold)
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.scrollDirection = .vertical
            layout.itemSize = CGSize(
                width: UIScreen.main.bounds.width - HOME_PAGE_PADDING * 2,
                height: 100
            )
            layout.minimumLineSpacing = 10
        }
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(PopularPostCell.self, forCellWithReuseIdentifier: "cell")
        
        selectionLine.backgroundColor = .grayScale100
    }
    
    override func setHierarchy() {
        super.setHierarchy()
        
        [sectionTitle, collectionView, selectionLine]
            .forEach { addSubview($0) }

    }
    
    override func setLayout() {
        super.setLayout()
        
        sectionTitle.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.left.right.equalToSuperview().inset(HOME_PAGE_PADDING)
        }
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(sectionTitle.snp.bottom).offset(20)
            $0.left.right.equalToSuperview().inset(HOME_PAGE_PADDING)
            $0.height.equalTo(320)
        }
        
        selectionLine.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(collectionView.snp.bottom).offset(20)
            $0.height.equalTo(10)
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setBind() {
        super.setBind()

        // FIXME: 예시 데이터
        let pets = Observable.just([
            PetModel(name: "무냥이", species: "고양이", gender: "수컷", age: 2),
            PetModel(name: "무냥이", species: "고양이", gender: "수컷", age: 2),
            PetModel(name: "무냥이", species: "고양이", gender: "수컷", age: 2),
        ])

        pets.bind(to: collectionView.rx.items(
            cellIdentifier: "cell",
            cellType: PopularPostCell.self)) { index, model, cell in
                cell.configure(
                    boardTitle: "자유 게시판",
                    postTitle: "OO동물병원 추천하지 않아요...",
                    heartCount: 10,
                    commentCount: 12,
                    postInfo: "| 1일전 | 제이지"
                )
        }
        .disposed(by: disposeBag)
    }
}
