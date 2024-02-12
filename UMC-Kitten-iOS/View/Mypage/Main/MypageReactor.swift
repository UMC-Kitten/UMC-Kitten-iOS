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
        var registredPets: [PetModel] = []
    }
    
    let initialState: State = State(
        registredPets: [
            .init(name: "고등어", species: "고양이", gender: "수컷", age: 4),
            .init(name: "치즈", species: "고양이", gender: "수컷", age: 2),
        ]
    )
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
            return state
        }
    }
}
