//
//  CommunityDetailViewController.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 1/31/24.
//

import UIKit

class CommunityDetailViewController: UIViewController {

    // MARK: - 프로퍼티
    let communityDetailView = CommunityDetailView()
    
    // MARK: - 라이프 사이클
    override func loadView() {
        view = communityDetailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - 메소드
    
}
