//
//  PostRxRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

import RxSwift

public class PostRxRepository {
    
    private let repository: PostRepository
    
    public init(repository: PostRepository) {
        self.repository = repository
    }
    
    public func getAllPostByBoard(
        boardType: BoardType,
        page: Int
    ) -> Observable<[PostModel]> {
        return Observable.create { observer in
            self.repository.getAllPostByBoard(boardType: boardType, page: page) { result, error in
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
    
    public func getPopularPost() -> Observable<[PostModel]> {
        return Observable.create { observer in
            self.repository.getPopularPost() { result, error in
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
    
    public func getTodayFeed() -> Observable<[PostModel]> {
        return Observable.create { observer in
            self.repository.getTodayFeed() { result, error in
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
