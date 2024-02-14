//
//  NicknameSettingReacotr.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import ReactorKit

class NicknameSettingReacotr: Reactor {
    
    let mypageRepository: MypageRxRepository
    
    init(mypageRepository: MypageRepository) {
        self.mypageRepository = MypageRxRepository(repository: mypageRepository)
    }
    
    enum Action {
        case viewWillAppear
        case tapChangeButton(nickname: String)
    }
    
    enum Mutation {
        case setUser(_ user: UserModel)
    }
    
    struct State {
        var user: UserModel?
    }
    
    let initialState: State = State()
}

extension NicknameSettingReacotr {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            LoadingIndicatorHelper.startLoading()
            // 유저 정보 가져오기
            let userObservable = mypageRepository
                .getUserInfo()
                .map { Mutation.setUser($0) }
                .do(onCompleted: {
                    LoadingIndicatorHelper.endLoading()
                })

            return Observable.merge([userObservable])
            
        case let .tapChangeButton(nickname): 
            return mypageRepository
                .changeUserNickname(nickname: nickname)
                .flatMap{ _ in Observable.empty() }
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
