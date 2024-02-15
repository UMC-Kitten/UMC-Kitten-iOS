//
//  OwnerSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

class OwnerSettingViewController: BaseViewController {
    
    // MARK: Dependency
    private let reactor = OwnerSettingReactor(mypageRepository: MypageRemoteRepository())
    
    // MARK: UI Component
    private let titleLabel: UILabel = .init()
    private let stackView: UIStackView = .init()
    private let ownerSelection = Selection(items: [
        Selection.Item(contentView: SelectCard(
            selectImageName: "dogncat-white",
            deselectImageName: "dogncat-black",
            description: "반려동물을 \n키우고 있어요")),
        Selection.Item(contentView: SelectCard(
            selectImageName: "owner-white",
            deselectImageName: "owner-black",
            description: "아직 키우고 \n있지는 않아요"))
    ])
    
    // MARK: Set Method
    override func setStyle() {
        self.title = "반려인 설정"
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        
        titleLabel.text = "나는 반려인으로 \n지금 어떤 상황에 해당되나요?"
        titleLabel.numberOfLines = 2
        titleLabel.setDefaultFont(size: 24, weight: .regular)
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() {
        [titleLabel, ownerSelection]
            .forEach { view.addSubview($0) }
        
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
            $0.leading.equalToSuperview().inset(20)
        }
        
        ownerSelection.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(220)
        }
        
        
    }
    
    override func setBind() {
        // - data binding
        reactor.state
            .dropFirst()
            .take(2)
            .map { $0.hasPet ? 0 : 1 }
            .distinctUntilChanged()
            .subscribe(onNext: { [weak self] in
                self?.ownerSelection.setDefaultSelectedIndex($0)
            })
            .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        ownerSelection.onChange
            .dropFirst()
            .distinctUntilChanged()
            .map { $0 == 0 ? true : false}
            .map { .changeHasPet($0) }
            .bind(to: reactor.action )
            .disposed(by: disposeBag)
    }
    
}
