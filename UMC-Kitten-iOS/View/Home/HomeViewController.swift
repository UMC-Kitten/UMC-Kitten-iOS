//
//  HomeViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import RxSwift
import RxAppState
import ReactorKit

class HomeViewController: BaseViewController {
    
    // MARK: Dependency
    private let reactor = HomeReactor()
    
    // MARK: UI Container
    private let scrollView: BaseScrollView = .init()
    
    // MARK: UI Component
    private let titleLabel: UILabel = .init(
        staticText: "나는 집사",
        fontSize: 24,
        fontWiehgt: .bold
    )
    private let registeredPetsSection: RegisteredPetsSection = .init()
    private let popularPostSection: PopularPostSection = .init()
    private let todayFeedSection: TodayFeedSection = .init()
    private let homeBottomSection: HomeBottomSection = .init()
    
    // MARK: Set Method
    override func setStyle() {
        configureNavigationBarTransparentAndTitleless()
    }
    
    override func setHierarchy() {
        HierarchySupporter.setupScrollView(
            in: view,
            scrollView: scrollView,
            addingSubviews: [titleLabel, registeredPetsSection, popularPostSection,
                             todayFeedSection, homeBottomSection]
        )
    }
    
    override func setLayout() {
        LayoutSupporter.layoutScrollView(scrollView)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
        }
        
        LayoutSupporter.layoutViewsSequentially(
            [registeredPetsSection, popularPostSection, todayFeedSection, homeBottomSection],
            startingBelow: titleLabel,
            verticalSpacing: 0
        )
    }
    
    override func setBind() {
        // data binding
        reactor.state
            .map {
                $0.registeredPets
            }
            .bind(to: registeredPetsSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: RegisteredPetCell.self)){ (row, pet, cell) in
                    cell.configure(
                        petImageName: pet.imageName,
                        petName: pet.name,
                        petInfo: "\(pet.species) / \(pet.gender) / \(pet.age)살"
                    )
                }
                .disposed(by: disposeBag)
        
        reactor.state
            .map {
                $0.popularPosts.prefix(HomeConstant.POPULAR_POST_DISPLAY_NUMBER)
            }
            .bind(to: popularPostSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: PopularPostCell.self)){ (row, post, cell) in
                    cell.configure(
                        boardTitle: post.boardTitle,
                        postTitle: post.postTitle,
                        heartCount: post.likeCount,
                        commentCount: post.commentCount,
                        postInfo: "| \(post.date.timeAgoDisplay()) | \(post.writer)"
                    )
                }
                .disposed(by: disposeBag)
        
        reactor.state
            .map {
                $0.todayFeeds.prefix(HomeConstant.TODAY_FEED_DISPLAY_NUMBER)
            }
            .bind(to: todayFeedSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: TodayFeedCell.self)){ (row, feed, cell) in
                    cell.configure(
                        feedImageName: feed.imageName,
                        feedTitle: feed.body
                    )
                }
                .disposed(by: disposeBag)
        
        // event binding
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
    }
    
}


