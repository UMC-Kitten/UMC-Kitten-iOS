//
//  MypageRxRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import RxSwift

class MypageRxRepository {
    
    private let repository: MypageRepository
    
    init(repository: MypageRepository) {
        self.repository = repository
    }
    
    func getUserInfo() -> Observable<UserModel> {
        return Observable.create { observer in
            self.repository.getUserInfo() { result, error in
                if let error = error {
                    observer.onError(error)
                } else if let result = result {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            
            return Disposables.create()
        }
    }    
    
    func changeUserNickname(nickname: String) -> Observable<Bool> {
        return Observable.create { observer in
            self.repository.changeUserNickname(nickname: nickname) { result, error in
                if let error = error {
                    observer.onError(error)
                } else if let result = result {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            
            return Disposables.create()
        }
    }
    
    func changeHasPet(hasPet: Bool) -> Observable<Bool> {
        return Observable.create { observer in
            self.repository.changeHasPet(hasPet: hasPet) { result, error in
                if let error = error {
                    observer.onError(error)
                } else if let result = result {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            
            return Disposables.create()
        }
    }
    
    func changeProfileImage(image: Data) -> Observable<Bool> {
        return Observable.create { observer in
            self.repository.changeProfileImage(image: image) { result, error in
                if let error = error {
                    observer.onError(error)
                } else if let result = result {
                    observer.onNext(result)
                    observer.onCompleted()
                }
            }
            
            return Disposables.create()
        }
    }
}
