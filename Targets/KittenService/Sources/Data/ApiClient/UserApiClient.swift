//
//  UserApiClient.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import Foundation

import Moya

/// 로그인 관련 API
public enum UserApiClient {
    case kakaoLogin(accessToken: String)
    case naverLogin(accessToken: String)
}

extension UserApiClient: TargetType {
    
    fileprivate var baseURLString: String {
        guard let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in Info.plist")
        }
        return apiBaseURLString
    }
    
    public var baseURL: URL {
        let urlString = baseURLString + ""
        guard let url = URL(string: urlString) else {
            fatalError("Constructed URL is invalid: \(urlString)")
        }
        return url
        
    }
    
    public var path: String {
        switch self {
        case .kakaoLogin:
            return "/kakao"
        case .naverLogin:
            return "/naver"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .kakaoLogin, .naverLogin:
            return .get
        }
    }
    
    public var task: Task {
        switch self {
        case let .kakaoLogin(accessToken):
            return .requestParameters(
                parameters: ["accessToken": accessToken],
                encoding: URLEncoding.queryString
            )
        case let .naverLogin(accessToken):
            return .requestParameters(
                parameters: ["accessToken": accessToken],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    public var sampleData: Data {
        return Data()
    }
}
