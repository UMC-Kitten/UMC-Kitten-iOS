//
//  AuthTokenPlugin.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation
import Moya

/// 헤더에 토큰을 설정하는 플러그인입니다.
struct AuthTokenPlugin: PluginType {
    let token: String

    func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        var request = request
        request.addValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        return request
    }
}
