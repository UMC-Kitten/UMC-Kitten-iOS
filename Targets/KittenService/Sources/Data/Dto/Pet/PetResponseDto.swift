//
//  PetResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

struct PetResponseDto: Codable {
    
    struct PetInfoDto: Codable {
        let id: Int64
        let type: PetTypeDto
        let name: String
        let petProfileImage: String
        let gender: GenderDto
        let notes: String
    }
    
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
