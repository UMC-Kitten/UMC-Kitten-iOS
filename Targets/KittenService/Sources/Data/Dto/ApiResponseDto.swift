//
//  ApiResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import Foundation

public struct ApiResponse<T: Codable>: Codable {
    public let isSuccess: Bool
    public let code: String
    public let message: String
    public let result: T
}
