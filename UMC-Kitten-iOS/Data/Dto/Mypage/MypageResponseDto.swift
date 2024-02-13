//
//  MypageResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct MypageResponseDto {
    
    struct UserResponseDto: Codable {
        let id: Int64
        let nickname: String
        let profileImage: String?
        let hasPet: Bool
        let pets: [PetDto]
        
        struct PetDto: Codable {
            let id: Int64
            let type: PetTypeDto
            let name: String
            let petProfileImage: String
            let gender: GenderDto
            let notes: String
        }

        enum PetTypeDto: String, Codable {
            case CAT
            case DOG
        }

        enum GenderDto: String, Codable {
            case MALE
            case FEMALE
        }
    }
    
}
