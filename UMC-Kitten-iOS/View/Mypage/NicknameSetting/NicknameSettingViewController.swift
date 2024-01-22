//
//  NicknameSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation
import UIKit

class NicknameSettingViewController: BaseViewController {
    
    // MARK: UI Component
    
    let nicknameTextField: TextField = .init(title: "닉네임")
    private let noticeBlackLabel: UILabel = .init(text: "* 닉네임을 설정하면")
    private let noticeColorLabel: UILabel = .init(text: " 10일간 변경할 수 없습니다")
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "닉네임 설정"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.nicknameTextField.textField.becomeFirstResponder()
    }
    
    
    // MARK: Set Methods
    
    override func setStyle() {
        noticeBlackLabel.setDefaultFont(size: 12)
        noticeBlackLabel.textColor = .grayScale500
        
        noticeColorLabel.setDefaultFont(size: 12)
        noticeColorLabel.textColor = .secondary
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() { 
        [nicknameTextField, noticeBlackLabel, noticeColorLabel]
            .forEach { view.addSubview($0) }
    }
    
    override func setLayout() { 
        nicknameTextField.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
        }
        
        noticeBlackLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.textField.snp.bottom).offset(20)
            $0.leading.equalToSuperview().inset(20)
        }
        
        noticeColorLabel.snp.makeConstraints {
            $0.top.equalTo(nicknameTextField.textField.snp.bottom).offset(20)
            $0.leading.equalTo(noticeBlackLabel.snp.trailing)
        }
    }
    
    override func setBind() { 

    }
    
}
