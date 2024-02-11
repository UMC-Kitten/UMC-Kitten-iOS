//
//  NicknameSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation
import UIKit

class NicknameSettingViewController: BaseViewController {
    
    var keyboardHeight: CGFloat = 0
    
    // MARK: UI Component
    
    private let nicknameTextField: TextField = .init(
        title: "닉네임",
        placeholder: "변경할 닉네임을 입력해주세요"
    )
    private let noticeBlackLabel: UILabel = .init(staticText: "* 닉네임을 설정하면")
    private let noticeColorLabel: UILabel = .init(staticText: " 10일간 변경할 수 없습니다")
    private let confirmButton: UIButton = .init(text: "수정")
    
    // MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "닉네임 설정"
        
        // 키보드 높이를 감지하는 옵저버 등록
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
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
        [nicknameTextField, noticeBlackLabel, noticeColorLabel, confirmButton]
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
        
        confirmButton.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(15)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardHeight)
            $0.height.equalTo(50)
        }
    }
    
    
    override func setBind() {

    }
    
    // MARK: Keyboard setting
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            keyboardHeight = keyboardFrame.height
            updateButtonConstraints()
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        keyboardHeight = 0
        updateButtonConstraints()
    }
    
    func updateButtonConstraints() {
        confirmButton.snp.updateConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-keyboardHeight)
        }

        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
