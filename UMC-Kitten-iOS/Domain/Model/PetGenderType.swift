//
//  GenderType.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

/// 반려동물 성별 종류
enum PetGenderType: String, Codable {
    case male = "MALE"
    case female = "FEMALE"
    
    var krDescription: String {
        switch self {
        case .male:
            return "수컷"
        case .female:
            return "암컷"
        }
}
