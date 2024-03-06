//
//  CommentResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public struct CommentResponseDto: Codable {
    
    public struct CommentPreviewDto: Codable {
        public var content: String
        public var createdAt: Date
    }
    
    public struct CommentPreviewListDto: Codable {
        public var commentList: [CommentPreviewDto]
        public var listSize: Int
//        var totalPage: Int
//        var totalElements: Int
//        var isFirst: Bool
//        var isLast: Bool
    }
    
}
