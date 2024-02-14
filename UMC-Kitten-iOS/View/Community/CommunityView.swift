//
//  CommunityView.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/22/24.
//

import UIKit
import SnapKit

final class CommunityView: UIView {

    // MARK: - 프로퍼티
    let tableView = UITableView()
    
    let title: UILabel = {
        let label = UILabel()
        label.setDefaultFont(size: 26, weight: .bold)
        label.textColor = .black
        label.text = "나는 집사"
        return label
    }()
    
    let firstTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("자랑해요", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    let secondTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("리뷰해요", for: .normal)
        button.setTitleColor(UIColor(red: 0.596, green: 0.596, blue: 0.62, alpha: 1), for: .normal)
        return button
    }()
    
    let thirdTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("자유게시판", for: .normal)
        button.setTitleColor(UIColor(red: 0.596, green: 0.596, blue: 0.62, alpha: 1), for: .normal)
        return button
    }()
    
    let fourthTapButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("입양/실종", for: .normal)
        button.setTitleColor(UIColor(red: 0.596, green: 0.596, blue: 0.62, alpha: 1), for: .normal)
        return button
    }()
    
    lazy var tapStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstTapButton, secondTapButton, thirdTapButton, fourthTapButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    var tapBottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    var tapBottomViewWidth: Constraint?
    var tapBottomViewLeading: Constraint?
    
    let plusButton: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = UIColor(red: 204/255, green: 213/255, blue: 174/255, alpha: 1)
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20
        return button
    }()
    
    private let horizontalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    private let verticalLine: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    // MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        
        setConstraints()
        setTableView()
        setLargeTitleNotCollapsing()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 메소드
    private func setConstraints() {
        self.addSubview(title)
        self.addSubview(tapStackView)
        self.addSubview(tableView)
        self.addSubview(tapBottomView)
        self.addSubview(plusButton)
        self.plusButton.addSubview(horizontalLine)
        self.plusButton.addSubview(verticalLine)
        
        title.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top)
            $0.leading.equalToSuperview().offset(26)
        }
        
        tapStackView.snp.makeConstraints {
            $0.top.equalTo(self.title.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        tapBottomView.snp.makeConstraints {
            $0.top.equalTo(self.tapStackView.snp.bottom)
            self.tapBottomViewLeading = $0.leading.equalTo(30).constraint
            self.tapBottomViewWidth = $0.width.equalTo(0).constraint
            $0.height.equalTo(4)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(self.tapBottomView.snp.bottom).offset(4)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        plusButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-28)
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).offset(-17)
            $0.width.height.equalTo(40)
        }
        
        verticalLine.snp.makeConstraints {
            $0.centerX.equalTo(plusButton.snp.centerX)
            $0.centerY.equalTo(plusButton.snp.centerY)
            $0.width.equalTo(3)
            $0.height.equalTo(18)
        }
        
        horizontalLine.snp.makeConstraints {
            $0.centerX.equalTo(plusButton.snp.centerX)
            $0.centerY.equalTo(plusButton.snp.centerY)
            $0.width.equalTo(18)
            $0.height.equalTo(3)
        }
    }
    
    private func setTableView() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    private func setLargeTitleNotCollapsing() {
        let dummyView = UIView()
        self.addSubview(dummyView)
        self.sendSubviewToBack(dummyView)
    }
}
