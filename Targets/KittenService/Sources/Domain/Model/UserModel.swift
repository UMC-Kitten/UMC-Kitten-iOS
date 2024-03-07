//
//  UserModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

public struct UserModel {
    public let id: Int64
    public let nickname: String
    public let profileImage: String?
    public let hasPet: Bool
    public let pets: [PetModel]
}
