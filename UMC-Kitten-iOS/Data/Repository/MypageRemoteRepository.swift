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
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(.getUserInfo(id: userId)) { [weak self] result in
            switch result {
            case .success(let response):
                do {
                    // response를 dto로 변환
                    let userDto = try response.map(
                        ApiResponse<MypageResponseDto.UserResponseDto>.self,
                        using: BaseDecoder()
                    ).result
                    
                    // dto를 도메인 객체로 변환 후 전달
                    let userModel = self?.convertToDomainModel(
                        userDto: userDto,
                        userId: userId
                    )
                    completion(userModel, nil)
                    
                } catch let error {
                    completion(nil, CommonError.failed(error: error))
                }
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func changeUserNickname(
        nickname: String,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(
            .changeNickname(
                dto: MypageRequestDto.ChangeNicknameRequestDto(
                    id: userId,
                    nickname: nickname
                )
            )
        ) { result in
            switch result {
            case .success(_):
                completion(true, nil)
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func changeHasPet(
        hasPet: Bool,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(
            .changeHasPet(
                dto: MypageRequestDto.ChangeHasPetRequestDto(
                    id: userId,
                    hasPet: hasPet
                )
            )
        ) { result in
            switch result {
            case .success(_):
                completion(true, nil)
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    func changeProfileImage(
        image: Data,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    ) {
        let userId = Int64(UserDefaults
            .standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(
            .changeProfileImage(id: userId, profileImage: image)
        ) { result in
            switch result {
            case .success(_):
                completion(true, nil)
                
            case .failure(let error):
                completion(nil, CommonError.failed(error: error))
            }
        }
    }
    
    
    private func convertToDomainModel(
        userDto: MypageResponseDto.UserResponseDto,
        userId: Int64
    ) -> UserModel {
        return UserModel(
            id: userId,
            nickname: userDto.nickname,
            profileImage: userDto.profileImage,
            hasPet: userDto.hasPet,
            pets: userDto.pets.map { petDto in
                PetModel(
                    id: petDto.id,
                    image: petDto.petProfileImage,
                    name: petDto.name,
                    species: PetSpeciesType(rawValue: petDto.type.rawValue)!,
                    gender: PetGenderType(rawValue: petDto.gender.rawValue)!,
                    age: 2 // FIXME: 나이가 db에 저장이 안됨
                )
            }
        )
    }
}
