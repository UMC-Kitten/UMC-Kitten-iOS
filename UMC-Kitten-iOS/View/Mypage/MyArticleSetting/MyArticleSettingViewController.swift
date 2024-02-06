//
//  MyArticleSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

import SnapKit
import RxSwift
import RxGesture

class MyArticleSettingViewController: BaseViewController {
    
    // MARK: UI Component
    var pageTapBar: MyArticlePageTapBar = .init()
    
    private lazy var pageViewController: UIPageViewController = {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal,
            options: nil
        )
        return pageViewController
    }()
    
    
    var currentPageIndex = 0
    var pages: [UIViewController] = [ // FIXME: 알맞은 게시글 오게 수정
        MyArticlePage(),
        MyArticlePage(),
        MyArticlePage(),
    ]
    
    // MARK: Set Method
    override func setStyle() { 
        self.title = "내 게시물 관리"
        
    }
    
    override func setDelegate() { 
        pageViewController.dataSource = self
        pageViewController.delegate = self
    }
    
    override func setHierarchy() {
        addChild(pageViewController)
        
        [pageTapBar, pageViewController.view]
            .forEach { view.addSubview($0) }
        
        pageViewController.didMove(toParent: self)
        
        if let firstViewController = pages.first {
            pageViewController.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func setLayout() { 
        
        pageTapBar.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(pageTapBar.snp.bottom)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func setBind() {
        
        /// 몇번째 Item을 선택했는지 index로 방출하는 옵저버
         let tapObservables = pageTapBar.items.enumerated().map { index, item in
             item.rx.tapGesture()
                 .when(.recognized)
                 .map { _ in index }
         }

         Observable.merge(tapObservables)
             .withUnretained(self)
             .subscribe(onNext: { (self, index) in
                  self.pageTapBar.selectTapItem(index)
                 
              })
              .disposed(by: disposeBag)
        
    }
    
}
