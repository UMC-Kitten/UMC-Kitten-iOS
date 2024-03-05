//
//  PostRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

import KittenUtil

import Moya

class PostRemoteRepository: PostRepository {
    
    private let client = BaseMoyaProvider<PostApiClient>().provider
    
    
    func getPostDetail(
        postId: Int64,
        completion: @escaping (_ result: PostModel?, _ error: Error?) -> Void
    ) {
        client.request(.getPostDetail(postId: postId)) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postDto = try response.map(ApiResponse<PostResponseDto.PostPreviewDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let boardType = BoardType(rawValue: postDto.result.postType.rawValue)! // board - 도메인, post - 원격
                    let postModel = self.convert(dto: postDto.result, boardType: boardType)
                    completion(postModel, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func getAllPostByBoard(
        boardType: BoardType,
        page: Int,
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    ) {
        client.request(.getPostsByBoard(
            postType: PostTypeDto(rawValue: boardType.rawValue)!,
            page: page)
        ) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postsDto = try response.map(ApiResponse<PostResponseDto.PostPreviewListDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let postModels = self.convert(dto: postsDto.result, boardType: boardType)
                    completion(postModels, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func getPopularPost(
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    ) {
        client.request(.getFreePostByLike(page: 0)
        ) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postsDto = try response.map(ApiResponse<PostResponseDto.PostPreviewListDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let postModels = self.convert(dto: postsDto.result, boardType: .free)
                    completion(postModels, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func getTodayFeed(
        completion: @escaping (_ result: [PostModel]?, _ error: Error?) -> Void
    ) {
        client.request(.getBoastPostRecent(page: 0)
        ) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postsDto = try response.map(ApiResponse<PostResponseDto.PostPreviewListDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let postModels = self.convert(dto: postsDto.result, boardType: .boast)
                    completion(postModels, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func addPost(
        post: PostModel,
        completion: @escaping (_ result: PostModel?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        let requestDto = convert(model: post)
        
        client.request(.addPost(userId: userId, post: requestDto)) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let postDto = try response.map(ApiResponse<PostResponseDto.PostPreviewDto>.self, using: BaseDecoder())
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let boardType = BoardType(rawValue: postDto.result.postType.rawValue)! // board - 도메인, post - 원격
                    let postModel = self.convert(dto: postDto.result, boardType: boardType)
                    completion(postModel, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func deletePost(
        postId: Int64,
        completion: @escaping (_ result: Bool?, _ error: Error?) -> Void
    ) {
        client.request(.deletePost(postId: postId)) { result in
            switch result {
            case .success(let response):
                completion(true, nil)
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    
    /// Post 도메인 모델을 PostDto로 변환
    private func convert(
        model: PostModel
    ) -> PostRequestDto.AddPostRequestDto {
        return PostRequestDto.AddPostRequestDto(
            title: model.postTitle,
            content: model.body,
            postType: PostTypeDto(rawValue: model.boardType.rawValue)!,
            hashtagList: []
        )
    }
    
    /// 응답받은 PostDto를 도메인 모델인 Post로 변환
    private func convert(
        dto: PostResponseDto.PostPreviewDto,
        boardType: BoardType
    ) -> PostModel {
        return PostModel(
            boardType: boardType,
            postTitle: dto.title,
            body: dto.content,
            likeCount: dto.likePreviewListDTO.listSize,
            commentCount: dto.commentPreviewListDTO.listSize,
            date: dto.createdAt,
            writer: dto.writerNickName
        )
    }
    
    
    /// 응답받은 PostListDto를 도메인 모델인 [Post]로 변환
    private func convert(
        dto: PostResponseDto.PostPreviewListDto,
        boardType: BoardType
    ) -> [PostModel] {
        return dto.postList.map {
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
    }
}
