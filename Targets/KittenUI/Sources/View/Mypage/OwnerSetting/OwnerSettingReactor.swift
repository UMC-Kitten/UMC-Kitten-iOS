//
//  OwnerSettingReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import KittenService
import KittenUtil

import ReactorKit

class OwnerSettingReactor: Reactor {
    
    let mypageRepository: MypageRxRepository
    
    init(mypageRepository: MypageRepository) {
        self.mypageRepository = MypageRxRepository(repository: mypageRepository)
    }
    
    enum Action {
        case viewWillAppear
        case changeHasPet(_ hasPet: Bool)
    }
    
    enum Mutation {
        case setHasPet(_ hasPet: Bool)
    }
    
    struct State {
        var hasPet: Bool
    }
    
    let initialState: State = State(
        hasPet: true
    )
}

extension OwnerSettingReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            LoadingIndicatorHelper.startLoading()
            // 유저 정보 가져오기
            let userObservable = mypageRepository
                .getUserInfo()
                .map { $0.hasPet }
                .map { Mutation.setHasPet($0) }
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }
                .do(onCompleted: {
                    LoadingIndicatorHelper.endLoading()
                })
            
            return Observable.merge(userObservable)
            
        case let .changeHasPet(hasPet):
            let changeHasPetObservable = mypageRepository
                .changeHasPet(hasPet: hasPet)
                .map { _ in
                    return Mutation.setHasPet(hasPet)
                }
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }
            
            return Observable.merge(
                .just(.setHasPet(hasPet)), // 반응속도 때문에 일단 바로 변경
                changeHasPetObservable
            )
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setHasPet(hasPet):
            state.hasPet = hasPet
            return state
        }
    }
}
