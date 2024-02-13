//
//  PostApiClient.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/13/24.
//

import Foundation

import Moya

/// 로그인 관련 API
enum PostApiClient {
    /// 게시판 별로 전체 조회
    case getPosts(postType: PostTypeDto, page: Int)
}

extension PostApiClient: TargetType {
    
    var baseURLString: String {
        guard let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in Info.plist")
        }
        return apiBaseURLString
    }
    
    var baseURL: URL {
        let urlString = baseURLString + "/posts"
        guard let url = URL(string: urlString) else {
            fatalError("Constructed URL is invalid: \(urlString)")
        }
        return url
        
    }
    
    var path: String {
        switch self {
        case let .getPosts(postType, page):
            return "/\(postType.rawValue)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case let .getPosts(postType, page):
            return .requestParameters(
                parameters: ["page": page],
                encoding: URLEncoding.queryString
            )
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
