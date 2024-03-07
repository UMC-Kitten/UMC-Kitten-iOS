//
//  LikeResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public struct LikeResponseDto: Codable {

    public struct LikePreviewDto: Codable {
        public let likeId: Int
        public let userId: Int
        public let createdAt: Date
    }

    public struct LikePreviewListDto: Codable {
        public let likeList: [LikePreviewDto]
        public let listSize: Int
    }
}
