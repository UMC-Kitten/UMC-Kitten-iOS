//
//  HomeViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

class HomeViewController: BaseViewController {
    
    // MARK: UI Container
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: UI Component
    private let titleLable: UILabel = .init(text: "나는 집사")
    private let registeredPetsSection: RegisteredPetsSection = .init()
    
    // MARK: Set Method
    override func setStyle() { 
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
        scrollView.backgroundColor = .white
        
        contentView.backgroundColor = .white
        
        titleLable.setDefaultFont(size: 24, weight: .bold)
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() { 
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [titleLable, registeredPetsSection]
            .forEach { contentView.addSubview($0) }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
            $0.height.equalTo(900)
        }
        
        titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
        }        
        
        registeredPetsSection.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
            $0.height.equalTo(100)
        }
    }
    
    override func setBind() { }
    
}

