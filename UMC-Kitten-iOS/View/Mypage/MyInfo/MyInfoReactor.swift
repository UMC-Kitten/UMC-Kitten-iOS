//
//  MyInfoReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import UIKit

import ReactorKit

class MyInfoReactor: Reactor {
    
    var viewController: UIViewController?
    
    enum Action {
        case updateProfileImage(UIImage)
    }
    
    enum Mutation {
        case setProfileImage(UIImage)
    }
    
    struct State {
        var profileImage: UIImage = UIImage(named: "cat-sample")! // FIXME: change default
    }
    
    let initialState: State = State()
}

extension MyInfoReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .updateProfileImage(let name):
            return .just(.setProfileImage(name))
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setProfileImage(profileImageName):
            state.profileImage = profileImageName
            return state
        }
    }
}
