//
//  MyPetSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

import SnapKit
import ReactorKit
import RxCocoa

class MyPetSettingViewController: BaseViewController {
    
    // MARK: Dependency
    let reactor = MyPetSettingReactor()
    
    // MARK: UI Component
    private let collectionView: BaseCollectionView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        self.title = "내 반려동물 관리"
        
        collectionView.delegate = self
//        collectionView.dataSource = self
        collectionView.register(MyPetCardCell.self, forCellWithReuseIdentifier: "cell")
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
    
    override func setBind() { 
        reactor.state.map { $0.pets }
            .bind(to: collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: MyPetCardCell.self)){ (row, pet, cell) in
                    cell.configure(
                        petImageName: pet.imageName,
                        petName: pet.name,
                        petInfo: "\(pet.species) / \(pet.gender) / \(pet.age)살"
                    )
            }
            .disposed(by: disposeBag)

        collectionView.rx.modelSelected(PetModel.self)
            .subscribe(onNext: { [weak self] pet in
                // Handle pet selection
            })
            .disposed(by: disposeBag)
    }
    
}
