//
//  PetRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import Moya

class PetRemoteRepository: PetRepository {
    
    private let client = BaseMoyaProvider<PetApiClient>().provider
    
    func getRegisteredPets(
        completion: @escaping (_ result: [PetModel]?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(.getRegisteredPets(userId: userId)) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let petsDto = try response.map(
                        ApiResponse<[PetResponseDto.PetInfoDto]>.self,
                        using: BaseDecoder()
                    )
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let petModels = self.convert(from: petsDto)
                    completion(petModels, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func deletePet(
        petId: Int64,
        completion: @escaping (_ result: Bool?, _ error: Error?) -> Void
    ) {
        
        client.request(.deletePet(petId: petId)) { result in
            switch result {
            case .success(let response):
                completion(true, nil)
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    
    /// 응답받은 PetDto를 도메인 모델인 Pet으로 변환
    private func convert(from petsDto: ApiResponse<[PetResponseDto.PetInfoDto]>) -> [PetModel] {
        return petsDto.result.map { petDto in
            PetModel(
                id: petDto.id,
                name: petDto.name,
                species: PetSpeciesType(rawValue: petDto.type.rawValue)!,
                gender: PetGenderType(rawValue: petDto.gender.rawValue)!,
                age: 2 // FIXME: 나이가 db에 저장이 안됨
            )
        }
    }
}
