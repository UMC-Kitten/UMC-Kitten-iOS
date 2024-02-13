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
    let reactor = MyPetSettingReactor(mypageRepository: MypageRemoteRepository())
    
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
        
        // - data binding
        // collection view에 pets 바인딩
        reactor.state.map { $0.pets }
            .bind(
                to: collectionView.rx.items(
                    cellIdentifier: "cell",
                    cellType: MyPetCardCell.self
                )){(row, pet, cell) in
                    
                    // 삭제 버튼 이벤트 바인딩
                    cell.deleteButton.rx.tap
                        .map { .tapPetDeleteButton(petId: pet.id) }
                        .bind(to: self.reactor.action)
                        .disposed(by: self.disposeBag)
                    
                    // 데이터 설정
                    cell.configure(
                        petId: pet.id,
                        petImageName: pet.imageName,
                        petName: pet.name,
                        petInfo: "\(pet.species.krDescription) / \(pet.gender.krDescription) / \(pet.age)살"
                    )
                }
                .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
}

