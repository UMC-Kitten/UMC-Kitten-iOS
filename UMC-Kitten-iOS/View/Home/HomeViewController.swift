//
//  HomeViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import RxSwift
import ReactorKit

class HomeViewController: BaseViewController {
    
    // MARK: Constant
    private let POPULAR_POST_DISPLAY_NUMBER: Int = 3
    private let TODAY_FEED_DISPLAY_NUMBER: Int = 4
    
    // MARK: Dependency
    private let reactor = HomeReactor()
    
    // MARK: UI Container
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: UI Component
    private let titleLable: UILabel = .init(text: "나는 집사")
    private let registeredPetsSection: RegisteredPetsSection = .init()
    private let popularPostSection: PopularPostSection = .init()
    private let todayFeedSection: TodayFeedSection = .init()
    private let homeBottomSection: HomeBottomSection = .init()
    
    // MARK: Set Method
    override func setStyle() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance.shadowColor = .clear
        
        scrollView.backgroundColor = .white
        scrollView.showsVerticalScrollIndicator = false
        
        contentView.backgroundColor = .white
        
        titleLable.setDefaultFont(size: 24, weight: .bold)
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [titleLable, registeredPetsSection, popularPostSection,
         todayFeedSection, homeBottomSection]
            .forEach { contentView.addSubview($0) }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
            $0.height.equalTo(1250)
        }
        
        titleLable.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
        }
        
        registeredPetsSection.snp.makeConstraints {
            $0.top.equalTo(titleLable.snp.bottom).offset(10)
            $0.left.right.equalToSuperview()
        }
        
        popularPostSection.snp.makeConstraints {
            $0.top.equalTo(registeredPetsSection.snp.bottom).offset(0)
            $0.left.right.equalToSuperview()
        }
        
        todayFeedSection.snp.makeConstraints {
            $0.top.equalTo(popularPostSection.snp.bottom).offset(0)
            $0.left.right.equalToSuperview()
        }
        
        homeBottomSection.snp.makeConstraints {
            $0.top.equalTo(todayFeedSection.snp.bottom).offset(0)
            $0.left.right.equalToSuperview()
        }
    }
    
    override func setBind() {
        reactor.state
            .withUnretained(self)
            .map { (self, state) in
                state.registredPets
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
            .withUnretained(self)
            .map { (self, state) in
                state.popularPosts.prefix(self.POPULAR_POST_DISPLAY_NUMBER)
            }
            .bind(to: popularPostSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: PopularPostCell.self)){ (row, post, cell) in
                    cell.configure(
                        boardTitle: post.boardTitle,
                        postTitle: post.postTitle,
                        heartCount: post.likeCount,
                        commentCount: post.commentCount,
                        postInfo: "\(post.date.timeAgoDisplay()) | \(post.writer)"
                    )
                }
                .disposed(by: disposeBag)
        
        reactor.state
            .withUnretained(self)
            .map { (self, state) in
                state.todayFeeds.prefix(self.TODAY_FEED_DISPLAY_NUMBER)
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
    }
    
}

