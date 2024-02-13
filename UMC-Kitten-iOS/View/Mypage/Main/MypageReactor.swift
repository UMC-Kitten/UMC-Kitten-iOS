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
        case setRegisteredPets(_ pets: [PetModel])
    }
    
    struct State {
        var user: UserModel?
        var registeredPets: [PetModel] = []
    }
    
    let initialState: State = State(
        registeredPets: []
    )
}

extension MypageReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            
            // 유저 정보 가져오기
            let userFetchObservable = mypageRepository
                .getUserInfo()
            
            // 유저 정보
            let userObservable = userFetchObservable
                .map { Mutation.setUser($0) }
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }
            
            // 유저의 반려동물 정보
            let petObservable = userFetchObservable
                .map { Mutation.setRegisteredPets($0.pets)}
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }
            
            return Observable.merge([userObservable, petObservable])
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setUser(user):
            print(user)
            state.user = user
            return state
        case let .setRegisteredPets(pets):
            state.registeredPets = pets
            return state
        }
    }
}
