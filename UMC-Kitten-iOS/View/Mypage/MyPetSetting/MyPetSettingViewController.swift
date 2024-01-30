//
//  MyPetSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

class MyPetSettingViewController: BaseViewController {
    
    // MARK: UI Component
    private let collectionView: BaseCollectionView = .init()
    
    let pets: [PetModel] = [
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
        .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
    ]
    
    
    // MARK: Set Method
    override func setStyle() {
        self.title = "내 반려동물 관리"
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MyPetCardCell.self, forCellWithReuseIdentifier: "myPetCardCell")
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() {
        [collectionView]
            .forEach { view.addSubview($0) }
    }
    
    override func setLayout() {
        
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.bottom.equalTo(view.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    override func setBind() { }
    
}
