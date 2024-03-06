//
//  MypageRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import Foundation

/// 마이페이지 관련 데이터 동작
public protocol MypageRepository {
    /// 유저 정보 조회
    func getUserInfo(
        completion: @escaping (_ result: UserModel?, _ error: Error?) -> Void
    )
    
    /// 유저 닉네임 변경
    func changeUserNickname(
        nickname: String,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    ) 
    
    /// 반려인 설정 변경
    func changeHasPet(
        hasPet: Bool,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    )
    
    /// 프로필 이미지 변경
    func changeProfileImage(
        image: Data,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    )
}
