//
//  PostRxRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

import RxSwift

class PostRxRemoteRepository {
    
    private let postRepository: PostRepository
    
    init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }
    
    func getAllPostByBoard(
        postType: PostTypeDto,
        page: Int
    ) -> Observable<[PostModel]> {
        return Observable.create { observer in
            self.postRepository.getAllPostByBoard(postType: postType, page: page) { result, error in
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
