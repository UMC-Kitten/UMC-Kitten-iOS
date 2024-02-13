//
//  CommonError.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

/// API 공통 에러
enum CommonError: Error {
    /// JWT 만료
    case jwtExpired
    /// 그 외 원인으로 실패한 경우
    case failed(error: Error)
}

extension CommonError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .jwtExpired:
            return "JWT has expired."
        case let .failed(error):
            return "\(error.localizedDescription)"
        }
    }
}
