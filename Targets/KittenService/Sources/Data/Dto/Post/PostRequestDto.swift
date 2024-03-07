//
//  PostRequestDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/18/24.
//

import Foundation

public struct PostRequestDto {
    public struct AddPostRequestDto: Codable {
        let title: String
        let content: String
        let postType: PostTypeDto
        let hashtagList: [String]
    }
}
