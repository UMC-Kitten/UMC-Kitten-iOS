//
//  PostError.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

/// Post API 관련 에러
enum PostError: Error {
    /// 올바른 게시판 타입이 아닌 경우
    case postTypeNotFound
}

extension PostError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .postTypeNotFound:
            return "Invalid post type. Possible types are: BOAST, FREE, REVIEW."
        }
    }
}

