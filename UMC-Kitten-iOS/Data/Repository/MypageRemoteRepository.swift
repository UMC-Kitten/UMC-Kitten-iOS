//
//  MypageRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import Foundation

/// 마이페이지 관련 데이터 동작을 서버 API를 이용해 실행
class MypageRemoteRepository: MypageRepository {
    
    private let client = BaseMoyaProvider<MypageApiClient>().provider
    
    func getUserInfo(
        completion: @escaping (_ result: UserModel?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults.standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(.getUserInfo(id: userId)) { result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let userDto = try response.map(
                        ApiResponse<MypageResponseDto.UserResponseDto>.self,
                        using: BaseDecoder()
                    ).result
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let userModel = UserModel(
                        nickname: userDto.nickname,
                        profileImage: userDto.profileImage,
                        hasPet: userDto.hasPet,
                        pets: userDto.pets.map {
                            PetModel(
                                name: $0.name,
                                species: PetSpeciesType(rawValue: $0.type.rawValue)! ,
                                gender: PetGenderType(rawValue: $0.gender.rawValue)!,
                                age: 2)
                        }
                    )
                    
                    completion(userModel, nil)
                    
                } catch let error as DecodingError{
                    completion(nil, CommonError.jsonDecodingFailed(decodingError: error as DecodingError))
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
}
