//
//  PetModel.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import Foundation

/// 반려동물 정보
public struct PetModel {
    /// 등록된 고유 아이디
    public let id: Int64
    /// 반려동물 이미지 이름
    public let image: String
    /// 반려동물 이름
    public let name: String
    /// 반려동물 종 - 고양이, 강아지
    public let species: PetSpeciesType
    /// 반려동물 성별 - 암컷, 수컷
    public let gender: PetGenderType
    /// 반려동물 나이
    public let age: Int
}
