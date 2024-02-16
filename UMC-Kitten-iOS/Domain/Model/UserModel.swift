//
//  UserModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

struct UserModel {
    let id: Int64
    let nickname: String
    let profileImage: String?
    let hasPet: Bool
    let pets: [PetModel]
}
