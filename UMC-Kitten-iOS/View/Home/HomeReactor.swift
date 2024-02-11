//
//  HomeReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import ReactorKit

class HomeReactor: Reactor {
    enum Action {
        case tapDeleteButton(petNumber: Int)
    }
    
    enum Mutation {
        case deletePet(petNumber: Int)
    }
    
    struct State {
        var registredPets: [PetModel] = []
        var popularPosts: [PostModel] = []
        var todayFeeds: [FeedModel] = []
    }
    
    let initialState: State = State(
        registredPets: [
            .init(name: "고등어", species: "고양이", gender: "수컷", age: 4),
            .init(name: "치즈", species: "고양이", gender: "수컷", age: 2),
        ],
        popularPosts: [
            PostModel(boardTitle: "자유게시판", postTitle: "예시 포스트", body: "예시 포스트 테스트 중입니다", likeCount: 3, commentCount: 3, date: Date.now, writer: "제이지"),
            PostModel(boardTitle: "자유게시판", postTitle: "예시 포스트", body: "예시 포스트 테스트 중입니다", likeCount: 3, commentCount: 3, date: Date.now, writer: "제이지"),
            PostModel(boardTitle: "자유게시판", postTitle: "예시 포스트", body: "예시 포스트 테스트 중입니다", likeCount: 3, commentCount: 5, date: Date.now, writer: "제이지"),
            PostModel(boardTitle: "자유게시판", postTitle: "예시 포스트", body: "예시 포스트 테스트 중입니다", likeCount: 3, commentCount: 3, date: Date.now, writer: "제이지"),
        ],
        todayFeeds: [
            FeedModel(imageName: "cat-sample", body: "오늘 저희 초코 미용했어요", date: Date.now, writer: "나나"),
            FeedModel(imageName: "cat-sample", body: "고등어 귀엽죠", date: Date.now, writer: "나나"),
            FeedModel(imageName: "cat-sample", body: "오늘 저희 초코 미용했어요", date: Date.now, writer: "나나"),
            FeedModel(imageName: "cat-sample", body: "오늘 저희 초코 미용했어요", date: Date.now, writer: "나나"),
        ]
    )
}

extension HomeReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case let .tapDeleteButton(petNumber):
            return Observable.just(.deletePet(petNumber: petNumber))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .deletePet(petNumber):
            state.registredPets.remove(at: petNumber)
            return state
        }
    }
}

