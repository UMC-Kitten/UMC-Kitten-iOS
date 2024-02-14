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
    private let selectCards: [SelectCard] = [
        .init(
            selectImageName: "dogncat-white",
            deselectImageName: "dogncat-black",
            description: "반려동물을 \n키우고 있어요"),
        .init(
            selectImageName: "owner-white",
            deselectImageName: "owner-black",
            description: "아직 키우고 \n있지는 않아요"
        ),
    ]
    
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
        [titleLabel, stackView]
            .forEach { view.addSubview($0) }
        
        selectCards
            .forEach{ stackView.addArrangedSubview($0) }
        
    }
    
    override func setLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(100)
            $0.leading.equalToSuperview().inset(20)
        }
        
        stackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.centerY.equalToSuperview()
            $0.height.equalTo(220)
        }
    }
    
    override func setBind() {
        // - data binding
        reactor.state
            .map { $0.hasPet }
            .distinctUntilChanged()
            .debug()
            .subscribe(onNext: {
                if($0 == true){
                    self.selectCards[0].configureUISelect()
                    self.selectCards[1].configureUIDeselect()
                } else {
                    self.selectCards[1].configureUISelect()
                    self.selectCards[0].configureUIDeselect()
                }
            })
            .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // "반려동물을 키우고 있어요" 선택
        selectCards[0].rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .map { _ in self.reactor.currentState.hasPet }
            .filter { $0 != true } // 값이 변경될 때만 실행
            .map { _ in .changeHasPet(true) }
            .bind(to: reactor.action )
            .disposed(by: disposeBag)
        
        // "아직 키우고 있지는 않아요" 선택
        selectCards[1].rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .map { _ in self.reactor.currentState.hasPet }
            .filter { $0 != false } // 값이 변경될 때만 실행
            .map { _ in .changeHasPet(false) }
            .bind(to: reactor.action )
            .disposed(by: disposeBag)
    }
    
}
