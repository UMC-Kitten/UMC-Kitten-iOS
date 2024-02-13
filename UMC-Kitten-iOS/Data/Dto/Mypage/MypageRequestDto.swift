//
//  MypageRequestDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct MypageRequestDto {
    
    struct ChangeNicknameRequestDto: Codable {
        let id: Int64
        let nickname: String
    }
    
    struct ChangeHasPetRequestDto: Codable {
        let id: Int64
        let hasPet: Bool
    }

    struct ChangeProfileImageRequestDto: Codable {
        let id: Int64
        let profileImage: String
    }
    
}
