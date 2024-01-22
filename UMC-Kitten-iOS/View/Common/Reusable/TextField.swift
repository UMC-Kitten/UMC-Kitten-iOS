//
//  TextField.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/22/24.
//

import Foundation
import UIKit

/// 타이틀+보더 텍스트 입력  필드
///
/// 타이틀과 보더가 있는 텍스트 입력 필드 입니다.
/// - Note: 한 페이지당 하나의 텍스트 필드가 있는 UX에 사용합니다. 아래와 같이 한페이지에 꽉 차도록 설정해주세요.
/// ```
/// textField.snp.makeConstraints {
///     $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
///     $0.leading.trailing.equalToSuperview().inset(20)
///     $0.bottom.equalToSuperview()
/// }
/// ```
/// - Warning: 여러개의 필드를 한번에 사용하기 위해서는 델리게이트 설정을 상위에서 다시 해주세요.
class TextField: BaseView {
    
    // MARK: UI Component
    
    private let titleLabel: UILabel = .init()
    let textField: UITextField = .init()
    private let underLine: UIView = .init()

    
    // MARK: Constructor
    convenience init(title: String) {
        self.init()
        self.titleLabel.text = title
    }
    
    // MARK: Set Methods
    
    override func setStyle() {
        titleLabel.setDefaultFont(size: 14)
        titleLabel.textColor = .grayScale600
        
        textField.placeholder = "변경할 닉네임을 입력해주세요"
        textField.delegate = self
        
        underLine.backgroundColor = .grayScale50

    }
    
    override func setHierarchy() {
        [titleLabel, textField, underLine]
            .forEach { self.addSubview($0) }
    }
    
    override func setLayout() { 
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(30)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(20)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(50)
        }
        
        underLine.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1.5)
        }
    }
    
}



extension TextField: UITextFieldDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        underLine.backgroundColor = .main
    }
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        underLine.backgroundColor = .grayScale50
    }
}

