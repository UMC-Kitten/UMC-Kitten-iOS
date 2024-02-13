//
//  PostRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation
import Moya

class PostRemoteRepository: PostRepository {
    
    private let client = BaseMoyaProvider<PostApiClient>().provider
    
    func getAllPostByBoard(
        boardType: BoardType,
        page: Int,
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    ) {
        client.request(.getPosts(
            postType: PostTypeDto(rawValue: boardType.rawValue)!,
            page: page)
        ) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postsDto = try response.map(ApiResponse<PostResponseDto.PostPreviewListDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let postModels = postsDto.result.postList.map {
                        PostModel(
                            boardType: boardType,
                            postTitle: $0.title,
                            body: $0.content,
                            likeCount: $0.likePreviewListDTO.listSize,
                            commentCount: $0.commentPreviewListDTO.listSize,
                            date: $0.createdAt,
                            writer: $0.writerNickName
                        )
                    }
                    completion(postModels, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
}
