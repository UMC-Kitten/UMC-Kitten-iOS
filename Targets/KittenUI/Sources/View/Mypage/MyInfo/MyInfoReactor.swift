//
//  MyInfoReactor.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import UIKit

import ReactorKit

class MyInfoReactor: Reactor {
    
    private let mypageRepository: MypageRxRepository
    
    init(mypageRepository: MypageRepository) {
        self.mypageRepository = MypageRxRepository(repository: mypageRepository)
    }
    
    var viewController: UIViewController?
    
    enum Action {
        case viewWillAppear
        case updateProfileImage(UIImage)
    }
    
    enum Mutation {
        case setProfileImage(UIImage)
    }
    
    struct State {
        var profileImage: UIImage = UIImage()
    }
    
    let initialState: State = State()
}

extension MyInfoReactor {
    
    func mutate(action: Action) -> Observable<Mutation> {
        switch action {
        case .viewWillAppear:
            // 유저 정보 가져오기
            let profileImageObservable = mypageRepository
                .getUserInfo()
                .map { $0.profileImage }
                .filterNil()
                .flatMap { ImageProvider.loadImage($0) }
                .filterNil()
                .map { Mutation.setProfileImage($0) }
                .catch { error in
                    print("Error loading user info: ", error)
                    return Observable.empty()
                }

            return Observable.merge([profileImageObservable])
            
        case .updateProfileImage(let image):
            guard let imageData = image.jpegData(compressionQuality: 1.0) else { return .empty() }
            
            return mypageRepository
                .changeProfileImage(image: imageData)
                .debug()
                .map { _ in .setProfileImage(image) }
                .catch { error in
                    print("Error change profile ", error)
                    return Observable.empty()
                }
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
