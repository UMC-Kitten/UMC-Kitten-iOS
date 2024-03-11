//
//  CommunityPostViewController.swift
//  UMC-Kitten-iOS
//
//  Created by 김정호 on 2/14/24.
//

import UIKit

class CommunityPostViewController: UIViewController {
    
    // MARK: - 프로퍼티
    private let communityPostView = CommunityPostView()
    
    // MARK: - 라이프 사이클
    override func loadView() {
        view = communityPostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
    }
    
    // MARK: - 메소드
    private func setNavigationBar() {
        title = "새 게시물 작성"
    }
}
