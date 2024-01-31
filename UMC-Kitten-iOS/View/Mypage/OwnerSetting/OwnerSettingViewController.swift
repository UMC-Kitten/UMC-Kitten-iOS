//
//  OwnerSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit
import SnapKit

class OwnerSettingViewController: BaseViewController {
    
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
    
    private var isSelected: Bool = true
    
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
        
        // FIXME: 내부 함수로 분리
        // 첫번째꺼가 선택된 액션
        selectCards[0].rx.tapGesture()
            .subscribe { _ in
                self.isSelected = true
                self.isSelected = false
                
                self.selectCards[0].configureUISelect()
                self.selectCards[1].configureUIDeselect()
                
            }
            .disposed(by: disposeBag)
        
        selectCards[1].rx.tapGesture()
            .subscribe { _ in
                self.isSelected = true
                self.isSelected = false
                
                self.selectCards[1].configureUISelect()
                self.selectCards[0].configureUIDeselect()
            }
            .disposed(by: disposeBag)
        
    }
    
}
