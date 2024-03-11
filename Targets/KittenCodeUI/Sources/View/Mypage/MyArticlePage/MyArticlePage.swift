//
//  MyArticlePage.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

import KittenCommonUI

class MyArticlePage: BaseViewController {
    
    // MARK: UI Component
    var tableView: UITableView = .init()
    
    // MARK: Set Method
    override func setStyle() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func setDelegate() {
        tableView.register(MyArticlePageTableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    override func setHierarchy() {
        view.addSubview(tableView)
    }
    
    override func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
