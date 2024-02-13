//
//  SpeciesType.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

/// 반려동물 종 종류
enum PetSpeciesType: String, Codable {
    case cat = "CAT"
    case dog = "DOG"
    
    var krDescription: String {
        switch self {
        case .cat:
            return "고양이"
        case .dog:
            return "강아지"
        }
    }
}
