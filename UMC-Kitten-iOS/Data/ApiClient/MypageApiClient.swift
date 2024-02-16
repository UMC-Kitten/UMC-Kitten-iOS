//
//  MypageApiClient.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation
import Moya

/// 유저 개인정보 관련 API
enum MypageApiClient {
    case getUserInfo(id: Int64)
    case changeNickname(dto: MypageRequestDto.ChangeNicknameRequestDto)
    case changeHasPet(dto: MypageRequestDto.ChangeHasPetRequestDto)
    case changeProfileImage(id: Int64, profileImage: Data)
}

extension MypageApiClient: TargetType {
    
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
        case let .getUserInfo(id):
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
        case .getUserInfo:
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
        case .getUserInfo:
            return .requestPlain
        case let .changeNickname(dto):
            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        case let .changeHasPet(dto):
            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        case let .changeProfileImage(id, image):
            let formData: [MultipartFormData] = [MultipartFormData(provider: .data(image), name: "file", fileName: "profile_image.jpg", mimeType: "image/jpeg"), ]
            return .uploadCompositeMultipart(formData, urlParameters: ["id": "\(id)"])
            //            return .requestCustomJSONEncodable(dto, encoder: JSONEncoder())
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .changeProfileImage:
            return ["Content-type": "multipart/form-data"]
        default:
            return ["Content-type": "application/json"]
        }
        
    }
    
    var sampleData: Data {
        return Data()
    }
}
