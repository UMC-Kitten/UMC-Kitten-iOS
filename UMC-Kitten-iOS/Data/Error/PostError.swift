//
//  PostError.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

enum PostError: Error {
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

