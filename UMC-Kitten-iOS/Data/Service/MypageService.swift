//
//  MypageService.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation
import Moya

enum MypageService {
    case info(id: Int64)
    case changeNickname(dto: ChangeNicknameRequestDto)
    case changeHasPet(dto: ChangeHasPetRequestDto)
    case changeProfileImage(dto: ChangeProfileImageRequestDto)
}

extension MypageService: TargetType {
    
    var baseURLString: String {
        guard let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in Info.plist")
        }
        return apiBaseURLString
    }
    
    var baseURL: URL {
        let urlString = baseURLString + "/mypage"
        guard let url = URL(string: urlString) else {
            fatalError("Constructed URL is invalid: \(urlString)")
        }
        return url
        
    }
    
    var path: String {
        switch self {
        case let .info( id):
            return "/info/\(id)"
        case .changeNickname:
            return "/change/nickname"
        case .changeHasPet:
            return "/change/hasPet"
        case .changeProfileImage:
            return "/change/profileImage"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .info:
            return .get
        case .changeNickname:
            return .post        
        case .changeHasPet:
            return .post
        case .changeProfileImage:
            return .post
        }
    }
    
    var task: Task {
        switch self {
        case .info:
            return .requestPlain
        case let .changeNickname(dto):
            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        case let .changeHasPet(dto):
            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        case let .changeProfileImage(dto):
            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
