//
//  HomeReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/6/24.
//

import UIKit

import KittenService

import ReactorKit

class HomeReactor: Reactor {
    
    private let petRepository: PetRxRepository
    private let postRepository: PostRxRepository
    
    init(
        petRepository: PetRepository,
        postRepository: PostRepository
    ) {
        self.petRepository = PetRxRepository(repository: petRepository)
        self.postRepository = PostRxRepository(repository: postRepository)
    }
    
    enum Action {
        case viewWillAppear
    }
    
    enum Mutation {
        case setRegisteredPets(pets: [PetModel])
        case setPopularPosts(posts: [PostModel])
        case setTodayFeeds(posts: [PostModel])
    }
    
    struct State {
        var registeredPets: [PetModel] = []
        var popularPosts: [PostModel] = []
        var todayFeeds: [PostModel] = []
    }
    
    let initialState: State = State()
}

extension HomeReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            
            // 유저 정보 가져와서 반려동물 정보 가져오기
            let petObservable = petRepository
                .getRegisteredPets()
                .map { Mutation.setRegisteredPets(pets: $0) }
                .catch { error in
                    print("Error loading pets: ", error)
                    return Observable.empty()
                }
            
            // 인기 게시글 받아오기
            let postObservable = postRepository
                .getPopularPost()
                .map { Mutation.setPopularPosts(posts: $0) }
                .catch { error in
                    print("Error loading popular posts:", error)
                    return Observable.empty()
                }
            
            // 오늘의 피드 받아오기
            let feedObservable = postRepository
                .getTodayFeed()
                .map { Mutation.setTodayFeeds(posts: $0) }
                .catch { error in
                    print("Error loading today feed:", error)
                    return Observable.empty()
                }
            
            return Observable.merge([petObservable, postObservable, feedObservable])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setRegisteredPets(pets):
            state.registeredPets = pets
            return state
        case let .setPopularPosts(posts):
            state.popularPosts = posts
            return state
        case let .setTodayFeeds(posts):
            state.todayFeeds = posts
            return state
            
        }
        
    }
}

