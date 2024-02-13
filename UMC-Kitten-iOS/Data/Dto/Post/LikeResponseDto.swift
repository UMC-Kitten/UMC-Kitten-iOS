//
//  LikeResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct LikeResponseDto: Codable {

    struct LikePreviewDto: Codable {
        let likeId: Int
        let userId: Int
        let createdAt: Date
    }

    struct LikePreviewListDto: Codable {
        let likeList: [LikePreviewDto]
        let listSize: Int
    }
}
