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
import RxDataSources

class MyPetSettingViewController: BaseViewController {
    
    // MARK: Dependency
    let reactor = MyPetSettingReactor(petRepository: PetRemoteRepository())
    
    // MARK: UI Component
    let collectionView: BaseCollectionView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        self.title = "내 반려동물 관리"
        
        collectionView.delegate = self
        //        collectionView.dataSource = self
        collectionView.register(MyPetInfoCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.register(MyPetAddCell.self, forCellWithReuseIdentifier: "addCell")
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
        reactor.state
            .map { $0.pets.map(MyPetSectionItem.petInfo) + [.addPet] } // 마지막에 addPet Cell 추가
            .map { [MyPetSection(items: $0)] }
            .bind(to: collectionView.rx.items(dataSource: dataSource))
            .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
    }
    
    // MARK: RxDataSource Setting
    
    typealias MyPetDataSource = RxCollectionViewSectionedReloadDataSource<MyPetSection>
    
    private lazy var dataSource = MyPetDataSource(configureCell: { dataSource, collectionView, indexPath, item in
        switch dataSource[indexPath] {
        case .petInfo(let pet):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MyPetInfoCell
            // 삭제 버튼 이벤트 바인딩
            cell.deleteButton.rx.tap
                .withUnretained(self)
                .map { _ in .tapPetDeleteButton(petId: pet.id) }
                .bind(to: self.reactor.action)
                .disposed(by: self.disposeBag)
            
            cell.configure(
                petId: pet.id,
                petImageName: pet.imageName,
                petName: pet.name,
                petInfo: "\(pet.species) / \(pet.gender) / \(pet.age)살"
            )
            return cell
            
        case .addPet:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "addCell", for: indexPath) as! MyPetAddCell
            return cell
        }
    })
}

enum MyPetSectionItem {
    case petInfo(PetModel)
    case addPet
}

struct MyPetSection {
    var items: [MyPetSectionItem]
}

extension MyPetSection: SectionModelType {
    typealias Item = MyPetSectionItem
    
    init(original: MyPetSection, items: [Item]) {
        self = original
        self.items = items
    }
}
