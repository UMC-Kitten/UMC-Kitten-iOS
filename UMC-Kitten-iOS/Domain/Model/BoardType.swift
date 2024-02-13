//
//  BoardType.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

enum BoardType: String, Codable {
    case boast = "BOAST"
    case review = "REVIEW"
    case free = "FREE"
    
    var krDescription: String {
        switch self {
        case .boast:
            return "자랑해요"
        case .review:
            return "리뷰해요"
        case .free:
            return "자유게시판"
        }
    }
}
