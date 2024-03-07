//
//  PetRxRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import RxSwift

public class PetRxRepository {
    
    private let repository: PetRepository
    
    public init(repository: PetRepository) {
        self.repository = repository
    }
    
    public func getRegisteredPets() -> Observable<[PetModel]> {
        return Observable.create { observer in
            self.repository.getRegisteredPets() { result, error in
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
    
    public func deletePet(petId: Int64) -> Observable<Bool> {
        return Observable.create { observer in
            self.repository.deletePet(petId: petId) { result, error in
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
