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
        var pets: [PetModel] = []
        var popularPosts: [PostModel] = []
    }
    
    let initialState: State = State(
        pets: [
            .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
            .init(name: "무냥이", species: "고양이", gender: "수컷", age: 4),
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
            state.pets.remove(at: petNumber)
            return state
        }
    }
}

