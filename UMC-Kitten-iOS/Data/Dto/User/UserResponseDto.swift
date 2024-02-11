//
//  UserResponseDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import Foundation

// 사용자 정보를 담는 객체
struct UserResponseDto: Codable {
    let id: Int
    let email: String
    let role: UserRole
    let createDate: Date
}

// 사용자 역할을 나타내는 Enum
enum UserRole: String, Codable {
    case roleAdmin = "ROLE_ADMIN"
}
