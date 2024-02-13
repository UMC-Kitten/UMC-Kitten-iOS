//
//  PostRxRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

import RxSwift

class PostRxRemoteRepository {
    
    private let repository: PostRepository
    
    init(repository: PostRepository) {
        self.repository = repository
    }
    
    func getAllPostByBoard(
        baordType: BoardType,
        page: Int
    ) -> Observable<[PostModel]> {
        return Observable.create { observer in
            self.repository.getAllPostByBoard(boardType: baordType, page: page) { result, error in
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
