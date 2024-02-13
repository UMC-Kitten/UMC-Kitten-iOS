//
//  CommentResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct CommentResponseDto: Codable {
    
    struct CommentPreviewDto: Codable {
        var content: String
        var createdAt: Date
    }
    
    struct CommentPreviewListDto: Codable {
        var commentList: [CommentPreviewDto]
        var listSize: Int
//        var totalPage: Int
//        var totalElements: Int
//        var isFirst: Bool
//        var isLast: Bool
    }
    
}
