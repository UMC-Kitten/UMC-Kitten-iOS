//
//  MypageResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public struct MypageResponseDto {
    
    public struct UserResponseDto: Codable {
        public let id: Int64
        public let nickname: String
        public let profileImage: String?
        public let hasPet: Bool
        public let pets: [PetDto]
        
        public struct PetDto: Codable {
            public let id: Int64
            public let type: PetTypeDto
            public let name: String
            public let petProfileImage: String
            public let gender: GenderDto
            public let notes: String
        }

        public enum PetTypeDto: String, Codable {
            case CAT
            case DOG
        }

        public enum GenderDto: String, Codable {
            case MALE
            case FEMALE
        }
    }
    
}
