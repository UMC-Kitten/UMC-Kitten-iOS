//
//  PostResponseDTO.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public struct PostResponseDto: Codable {
    
    public struct JoinPostResultDto: Codable {
        public var postId: Int
        public var createdAt: Date
    }
    
    public struct PostPreviewDto: Codable {
        public var title: String
        public var content: String
        public var postType: PostTypeDto
        public var writerNickName: String
        public var createdAt: Date
        public var commentPreviewListDTO: CommentResponseDto.CommentPreviewListDto
        public var likePreviewListDTO: LikeResponseDto.LikePreviewListDto
        public var hashtagList: [HashtagResponseDto]?
    }
    
    public struct PostPreviewListDto: Codable {
        public var postList: [PostPreviewDto]
        public var listSize: Int
        public var totalPage: Int
        public var totalElements: Int
        public var isFirst: Bool
        public var isLast: Bool
    }
}
