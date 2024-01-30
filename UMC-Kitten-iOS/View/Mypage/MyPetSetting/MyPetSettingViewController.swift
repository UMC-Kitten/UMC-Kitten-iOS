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
    private let titleLabel: UILabel = .init()
    private let petCards: [MyPetCard] = [
        .init(petName: "무냥이", petInfo: "고양이 / 수컷/ 4살"),
        .init(petName: "무냥이", petInfo: "고양이 / 수컷/ 4살"),
        .init(petName: "무냥이", petInfo: "고양이 / 수컷/ 4살"),
    ]
    
    
    // MARK: Set Method
    override func setStyle() {
        self.title = "내 반려동물 관리"
        
        titleLabel.text = "내 반려동물"
        titleLabel.setDefaultFont(size: 24, weight: .bold)
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() {
        [titleLabel]
            .forEach { view.addSubview($0) }
    }
    
    override func setLayout() { 
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.equalToSuperview().inset(15)
        }
    }
    
    override func setBind() { }
    
}
