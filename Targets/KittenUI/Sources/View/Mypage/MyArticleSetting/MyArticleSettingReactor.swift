//
//  MyArticleSettingReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/16/24.
//

import Foundation

import KittenService

import ReactorKit

class MyArticleSettingReactor: Reactor {
    
    private let postRepository: PostRxRepository
    private let mypageRepository: MypageRxRepository
    
    init(
        postRepository: PostRepository,
        mypageRepository: MypageRepository
    ) {
        self.postRepository = PostRxRepository(repository: postRepository)
        self.mypageRepository = MypageRxRepository(repository: mypageRepository)
    }
    
    enum Action {
        case viewWillAppear
    }
    
    enum Mutation {
        case setFreeBoardPosts(_ posts: [PostModel])
        case setBoastBoardPosts(_ posts: [PostModel])
        case setReviewBoardPosts(_ posts: [PostModel])
    }
    
    struct State {
        var freeBoardPosts: [PostModel]
        var boastBoardPosts: [PostModel]
        var reviewBoardPosts: [PostModel]
    }
    
    let initialState: State = State(
        freeBoardPosts: [],
        boastBoardPosts: [],
        reviewBoardPosts: []
    )
}

extension MyArticleSettingReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            
            // 유저 정보 가져오기
            let userObservable = mypageRepository
                .getUserInfo()

            // 자유 게시판 가져오기 및 필터링
            let fetchFreeBoardObservable = userObservable
                .flatMap { user -> Observable<[PostModel]> in
                    self.postRepository.getAllPostByBoard(boardType: .free, page: 0)
                        .map { posts in
                            // 현재 유저의 글만 필터링
                            posts.filter { $0.writer == user.nickname }
                        }
                }
                .map { Mutation.setFreeBoardPosts($0) }
                .catch { error in
                    print("Error loading post: ", error)
                    return Observable.empty()
                }
            
            // 자랑해요 게시판 가져오기 및 필터링
            let fetchBoastBoardObservable = userObservable
                .flatMap { user -> Observable<[PostModel]> in
                    self.postRepository.getAllPostByBoard(boardType: .boast, page: 0)
                        .map { posts in
                            posts.filter { $0.writer == user.nickname }
                        }
                }
                .map { Mutation.setBoastBoardPosts($0) }
                .catch { error in
                    print("Error loading post: ", error)
                    return Observable.empty()
                }

            // 리뷰 게시판 가져오기 및 필터링
            let fetchReviewBoardObservable = userObservable
                .flatMap { user -> Observable<[PostModel]> in
                    self.postRepository.getAllPostByBoard(boardType: .review, page: 0)
                        .map { posts in
                            posts.filter { $0.writer == user.nickname }
                        }
                }
                .map { Mutation.setReviewBoardPosts($0) }
                .catch { error in
                    print("Error loading post: ", error)
                    return Observable.empty()
                }
            
            
            return Observable.merge([
                fetchFreeBoardObservable,
                fetchBoastBoardObservable,
                fetchReviewBoardObservable
            ])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setFreeBoardPosts(posts):
            state.freeBoardPosts = posts
            return state
        case let .setBoastBoardPosts(posts):
            state.boastBoardPosts = posts
            return state
        case let .setReviewBoardPosts(posts):
            state.reviewBoardPosts = posts
            return state
        }
    }
}

