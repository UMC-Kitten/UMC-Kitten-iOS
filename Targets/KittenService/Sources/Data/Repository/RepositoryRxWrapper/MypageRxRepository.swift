//
//  MypageRxRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import RxSwift

public class MypageRxRepository {
    
    private let repository: MypageRepository
    
    public init(repository: MypageRepository) {
        self.repository = repository
    }
    
    public func getUserInfo() -> Observable<UserModel> {
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
    
    public func changeUserNickname(nickname: String) -> Observable<Bool> {
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
    
    public func changeHasPet(hasPet: Bool) -> Observable<Bool> {
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
    
    public func changeProfileImage(image: Data) -> Observable<Bool> {
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
