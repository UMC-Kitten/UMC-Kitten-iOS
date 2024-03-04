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
    private let reactor = HomeReactor(
        petRepository: PetRemoteRepository(),
        postRepository: PostRemoteRepository()
    )
    
    // MARK: UI Container
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: UI Component
    private let titleLabel: UILabel = .init(staticText: "나는 집사")
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
        
        titleLabel.setDefaultFont(size: 24, weight: .bold)
    }
    
    override func setDelegate() { }
    
    override func setHierarchy() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [titleLabel, registeredPetsSection, popularPostSection,
         todayFeedSection, homeBottomSection]
            .forEach { contentView.addSubview($0) }
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
            //            $0.height.equalTo(1250)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-10)
            $0.left.equalToSuperview().offset(20)
        }
        
        registeredPetsSection.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
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
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setBind() {
        // - data binding
        // 내 반려동물 정보 바인딩
        reactor.state
            .map { $0.registeredPets }
            .bind(to: registeredPetsSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: RegisteredPetCell.self)
            ){ (row, pet, cell) in
                cell.configure(
                    petImageName: pet.image,
                    petName: pet.name,
                    petInfo: "\(pet.species.krDescription) / \(pet.gender.krDescription) / \(pet.age)살"
                )
            }
            .disposed(by: disposeBag)
        
        // 인기 게시글 바인딩
        reactor.state
            .map {
                $0.popularPosts.prefix(HomeConstant.POPULAR_POST_DISPLAY_NUMBER)
            }
            .bind(to: popularPostSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: PopularPostCell.self)
            ){ (row, post, cell) in
                cell.configure(
                    boardTitle: post.boardType.krDescription,
                    postTitle: post.postTitle,
                    heartCount: post.likeCount,
                    commentCount: post.commentCount,
                    postInfo: "| \(post.date.timeAgoDisplay()) | \(post.writer)"
                )
            }
            .disposed(by: disposeBag)
        
        // 오늘의 피드 바인딩
        reactor.state
            .map {
                $0.todayFeeds.prefix(HomeConstant.TODAY_FEED_DISPLAY_NUMBER)
            }
            .bind(to: todayFeedSection.collectionView.rx.items(
                cellIdentifier: "cell",
                cellType: TodayFeedCell.self)
            ){ (row, post, cell) in
                cell.configure(
                    feedImageName: post.imageUrl ?? "cat-sample",
                    feedTitle: post.body
                )
            }
            .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        popularPostSection.moreButton.rx.tapGesture()
            .subscribe(onNext: {_ in 
                print("더보기 이동")
            })
            .disposed(by: disposeBag)
        
        todayFeedSection.moreButton.rx.tapGesture()
            .subscribe(onNext: {_ in
                print("더보기 이동")
            })
            .disposed(by: disposeBag)
        
    }
    
}

