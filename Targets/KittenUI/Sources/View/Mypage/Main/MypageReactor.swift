//
//  MypageReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/15/24.
//

import Foundation

import ReactorKit

class MypageReactor: Reactor {
    
    let mypageRepository: MypageRxRepository
    
    init(mypageRepository: MypageRepository) {
        self.mypageRepository = MypageRxRepository(repository: mypageRepository)
    }
    
    enum Action {
        case viewWillAppear
    }
    
    enum Mutation {
        case setUser(_ user: UserModel)
    }
    
    struct State {
        var user: UserModel?
    }
    
    let initialState: State = State()
}

extension MypageReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            // 유저 정보 가져오기
            let userObservable = mypageRepository
                .getUserInfo()
                .map { Mutation.setUser($0) }
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }

            return Observable.merge([userObservable])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setUser(user):
            state.user = user
            return state
        }
    }
}
