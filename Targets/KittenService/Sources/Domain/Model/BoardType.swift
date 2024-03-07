//
//  BoardType.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public enum BoardType: String, Codable {
    case boast = "BOAST"
    case review = "REVIEW"
    case free = "FREE"
    
    public var krDescription: String {
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
