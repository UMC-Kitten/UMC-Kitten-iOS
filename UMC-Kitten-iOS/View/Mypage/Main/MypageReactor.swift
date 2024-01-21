//
//  MypageReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/15/24.
//

import Foundation

import ReactorKit

class MypageReactor: Reactor {
    enum Action {
        case tapMyPetManagementButton
    }
    
    enum Mutation {
        case setFollowing(Bool)
    }
    
    struct State {
        var isFollowing: Bool = false
    }
    
    let initialState: State = State()
}

extension MypageReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .tapMyPetManagementButton:
            return Observable.just(.setFollowing(true))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setFollowing(isFollowing):
            state.isFollowing = isFollowing
            print(state)
            return state
        }
    }
}
