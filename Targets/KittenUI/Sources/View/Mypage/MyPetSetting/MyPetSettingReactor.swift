//
//  MyPetSettingReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/31/24.
//

import UIKit

import KittenService
import KittenUtil

import ReactorKit

class MyPetSettingReactor: Reactor {
    
    private let petRepository: PetRxRepository
    
    init(petRepository: PetRepository) {
        self.petRepository = PetRxRepository(repository: petRepository)
    }
    
    enum Action {
        case viewWillAppear
        case tapPetDeleteButton(petId: Int64)
        
        case deletePet(_ petId: Int64)
    }
    
    enum Mutation {
        case setPets(_ pets: [PetModel])
        case deletePet(_ petId: Int64)
    }
    
    struct State {
        var pets: [PetModel]
    }
    
    let initialState: State = State(
        pets: []
    )
}

extension MyPetSettingReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            // 유저 정보 가져와서 반려동물 정보 가져오기
            let userObservable = petRepository
                .getRegisteredPets()
                .map { Mutation.setPets($0) }
                .catch { error in
                    print("Error loading pets: ", error)
                    return Observable.empty()
                }

            return Observable.merge([userObservable])
            
        case let .tapPetDeleteButton(petId):
            let confirmAction = UIAlertAction(title: "확인", style: .destructive) { _ in
                self.action.onNext(.deletePet(petId))
            }
            AlertHelper.showAlert(
                message: "등록된 반려동물을 삭제하시겠습니까?",
                action: confirmAction
            )
            
            return .empty()
            
        case let .deletePet(petId):            
            return petRepository
                .deletePet(petId: petId)
                .map { _ in Mutation.deletePet(petId) }
                .catch { error in
                    print("Error loading pets: ", error)
                    return Observable.empty()
                }
        }
    }
    
    func reduce(state: State, mutation: Mutation) -> State {
        var state = state
        switch mutation {
        case let .setPets(pets):
            state.pets = pets
            return state
            
        case let .deletePet(petId):
            if let index = state.pets.firstIndex(where: { $0.id == petId }) {
                state.pets.remove(at: index)
            }
            return state
        }
    }
}
