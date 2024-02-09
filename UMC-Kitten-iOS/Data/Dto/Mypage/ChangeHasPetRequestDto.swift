//
//  ChangeHasPetRequestDto.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation

struct ChangeHasPetRequestDto: Codable {
    let id: Int64
    let hasPet: Bool
}
