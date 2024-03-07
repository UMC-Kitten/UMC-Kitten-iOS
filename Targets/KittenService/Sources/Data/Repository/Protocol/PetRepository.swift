//
//  PetRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

public protocol PetRepository {
    /// 등록된 반려동물 조회
    func getRegisteredPets(
        completion: @escaping (_ result: [PetModel]?, _ error: Error?) -> Void
    )
    
    /// 반려동물 삭제
    func deletePet(
        petId: Int64,
        completion: @escaping (_ result: Bool?, _ error: Error?) -> Void
    )
}
