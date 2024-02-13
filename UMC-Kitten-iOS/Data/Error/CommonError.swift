//
//  CommonError.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

enum CommonError: Error {
    case failed(error: Error)
    case jsonDecodingFailed(decodingError: DecodingError)
}

extension CommonError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case let .failed(error):
            return "\(error.localizedDescription)"
        case let .jsonDecodingFailed(decodingError):
            return "JSON decoding failed for: \(decodingError)"
        }
    }
}
