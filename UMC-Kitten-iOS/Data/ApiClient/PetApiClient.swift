//
//  PetApiClient.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import Moya

enum PetApiClient {
    case getRegisteredPets(userId: Int64)
    case deletePet(petId: Int64)
}

extension PetApiClient: TargetType {
    
    var baseURLString: String {
        guard let apiBaseURLString = Bundle.main.object(forInfoDictionaryKey: "API_BASE_URL") as? String else {
            fatalError("API_BASE_URL is not set in Info.plist")
        }
        return apiBaseURLString
    }
    
    var baseURL: URL {
        let urlString = baseURLString
        guard let url = URL(string: urlString) else {
            fatalError("Constructed URL is invalid: \(urlString)")
        }
        return url
        
    }
    
    var path: String {
        switch self {
        case .getRegisteredPets(userId: let userId):
            return "/\(userId)/pets"
        case .deletePet(petId: let petId):
            return "/pet/\(petId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getRegisteredPets(userId: let userId):
            return .get
        case .deletePet(petId: let petId):
            return .delete
        }
    }
    
    var task: Task {
        switch self {
        case .getRegisteredPets(userId: let userId):
            return .requestPlain
        case .deletePet(petId: let petId):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    var sampleData: Data {
        return Data()
    }
}
