//
//  CommunityDetailView.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/31/24.
//

import UIKit
import SnapKit
import ImageSlideshow

class CommunityDetailView: UIView {

    // MARK: - 프로퍼티
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: .zero)
        return scrollView
    }()
    
    
    
    private let commentsTableView = UITableView()
    
    // MARK: - 생성자
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        setConstraints()
        //setTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 메소드
    private func setConstraints() {
        self.addSubview(scrollView)
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
    }
    
//    private func setTableView() {
//        tableView.separatorStyle = .none
//        tableView.showsVerticalScrollIndicator = false
//    }
}
