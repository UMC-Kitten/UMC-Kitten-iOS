//
//  MyArticleSettingViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

import KittenService

import SnapKit
import RxSwift
import RxCocoa
import RxGesture

class MyArticleSettingViewController: BaseViewController {
    
    // MARK: Dependency
    private let reactor = MyArticleSettingReactor(
        postRepository: PostRemoteRepository(),
        mypageRepository: MypageRemoteRepository()
    )
    
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
        // - data binding
        // 자유게시판 바인딩
        let freeBoardPage = pages[0] as! MyArticlePage
        reactor.state
            .map {
                $0.freeBoardPosts
            }
            .bind(to: freeBoardPage.tableView.rx.items(
                cellIdentifier: "cell",
                cellType: MyArticlePageTableViewCell.self)
            ){ (row, post, cell) in
                cell.configure(
                    userNickname: post.writer,
                    content: post.body
                )
            }
            .disposed(by: disposeBag)
        
        // 자랑해요 게시판
        let boastBoardPage = pages[1] as! MyArticlePage
        reactor.state
            .map {
                $0.boastBoardPosts
            }
            .bind(to: boastBoardPage.tableView.rx.items(
                cellIdentifier: "cell",
                cellType: MyArticlePageTableViewCell.self)
            ){ (row, post, cell) in
                cell.configure(
                    userNickname: post.writer,
                    content: post.body
                )
            }
            .disposed(by: disposeBag)
        
        // 리뷰해요 게시판
        let reviewBoardPage = pages[2] as! MyArticlePage
        reactor.state
            .map {
                $0.reviewBoardPosts
            }
            .bind(to: reviewBoardPage.tableView.rx.items(
                cellIdentifier: "cell",
                cellType: MyArticlePageTableViewCell.self)
            ){ (row, post, cell) in
                cell.configure(
                    userNickname: post.writer,
                    content: post.body
                )
            }
            .disposed(by: disposeBag)
        
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        
        /// 몇번째 Item을 선택했는지 index로 방출하는 옵저버
        let tapObservables = pageTapBar.items.enumerated().map { index, item in
            item.rx.tapGesture()
                .when(.recognized)
                .map { _ in index }
        }
        
        Observable.merge(tapObservables)
            .withUnretained(self)
            .subscribe(onNext: { (self, index) in
                // 상단 탭바 아이템 선택 처리
                self.pageTapBar.selectTapItem(index)
                
                // 선택된 페이지
                let selectedPage = self.pages[index]

                // 현재 페이지 인덱스와 선택된 페이지 인덱스를 비교하여 방향 결정
                let direction: UIPageViewController.NavigationDirection = index > self.currentPageIndex ? .forward : .reverse

                // currentPageIndex 업데이트
                self.currentPageIndex = index

                // 페이지 뷰 컨트롤러에 선택된 페이지와 방향 설정
                self.pageViewController.setViewControllers([selectedPage], direction: direction, animated: true, completion: nil)
                
            })
            .disposed(by: disposeBag)
        
    }
    
}
