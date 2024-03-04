//
//  PostResponseDTO.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct PostResponseDto: Codable {
    
    struct JoinPostResultDto: Codable {
        var postId: Int
        var createdAt: Date
    }
    
    struct PostPreviewDto: Codable {
        var title: String
        var content: String
        var postType: PostTypeDto
        var writerNickName: String
        var createdAt: Date
        var commentPreviewListDTO: CommentResponseDto.CommentPreviewListDto
        var likePreviewListDTO: LikeResponseDto.LikePreviewListDto
        var hashtagList: [HashtagResponseDto]?
    }
    
    struct PostPreviewListDto: Codable {
        var postList: [PostPreviewDto]
        var listSize: Int
        var totalPage: Int
        var totalElements: Int
        var isFirst: Bool
        var isLast: Bool
    }
}
