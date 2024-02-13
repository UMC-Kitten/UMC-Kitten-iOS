//
//  MypageRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import Foundation

/// 마이페이지 관련 데이터 동작
protocol MypageRepository {
    func getUserInfo(
        completion: @escaping (_ result: UserModel?, _ error: Error?) -> Void
    )
    
    func changeUserNickname(
        nickname: String,
        completion: @escaping (_ isSuccess: Bool?, _ error: Error?) -> Void
    ) 
}
