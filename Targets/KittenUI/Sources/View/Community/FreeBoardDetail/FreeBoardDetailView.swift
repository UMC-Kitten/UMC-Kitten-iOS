//
//  FreeBoardDetailView.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/1/24.
//

import UIKit
import SnapKit

class FreeBoardDetailView: UIView {

    // MARK: - 프로퍼티
    let tableView = UITableView()
    
    private let divisionLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.961, green: 0.961, blue: 0.961, alpha: 1)
        return view
    }()
    
    private let commentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "person.circle")
        return imageView
    }()
        
    let commentTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "댓글을 입력하세요"
        textField.font = .systemFont(ofSize: 14)
        return textField
    }()
    
    private let commentButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(systemName: "paperplane"), for: .normal)
        button.tintColor = UIColor(red: 0.733, green: 0.733, blue: 0.733, alpha: 1)
        return button
    }()
    
    // MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setConstraints()
        setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 메소드
    private func setConstraints() {
        self.addSubview(tableView)
        self.addSubview(divisionLineView)
        self.addSubview(commentImage)
        self.addSubview(commentTextField)
        self.addSubview(commentButton)
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(divisionLineView.snp.top)
        }
        
        divisionLineView.snp.makeConstraints {
            $0.top.equalTo(tableView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(4)
        }
        
        commentImage.snp.makeConstraints {
            $0.top.equalTo(divisionLineView.snp.bottom).offset(12)
            $0.leading.equalToSuperview().inset(14)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(12)
            $0.width.height.equalTo(30)
        }
        
        commentTextField.snp.makeConstraints {
            $0.centerY.equalTo(commentImage.snp.centerY)
            $0.leading.equalTo(commentImage.snp.trailing).offset(10)
            $0.trailing.equalTo(commentButton.snp.leading)
            $0.height.equalTo(26)
        }
        
        commentButton.snp.makeConstraints {
            $0.centerY.equalTo(commentImage.snp.centerY)
            $0.leading.equalTo(commentTextField.snp.trailing)
            $0.trailing.equalToSuperview().inset(16)
            $0.width.height.equalTo(26)
        }
    }
    
    private func setTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
}
