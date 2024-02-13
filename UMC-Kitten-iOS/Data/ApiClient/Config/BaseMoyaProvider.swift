//
//  BaseMoyaProvider.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation
import Moya

/// 요청에 공통적으로 필요한 플러그인을 추가한 MoyaProvider입니다.
class BaseMoyaProvider<T: TargetType> {
    /// 제네릭으로 MoyaProvider를 생성합니다.
    var provider: MoyaProvider<T> {
        // UserDefaults에서 토큰 가져오기
        guard let token = UserDefaults.standard.string(forKey: UserDefaultsConstant.JWT_KEY) else {
            fatalError("Auth token must be set in UserDefaults before using the provider")
        }
        // Auth token 관련 플러그인 추가
        let authPlugin = AuthTokenPlugin(token: token)
        return MoyaProvider<T>(plugins: [authPlugin])
    }
}
