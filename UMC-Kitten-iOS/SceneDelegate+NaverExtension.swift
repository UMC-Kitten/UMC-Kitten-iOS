//
//  SceneDelegate+NaverExtension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/18/24.
//

import Foundation

import NaverThirdPartyLogin
import Moya

// MARK: Naver login delegate
extension SceneDelegate: NaverThirdPartyLoginConnectionDelegate {
    // 토큰 발급 성공시
    func oauth20ConnectionDidFinishRequestACTokenWithAuthCode() {
        guard let instance = NaverThirdPartyLoginConnection.getSharedInstance() else { return }
        
        // 액세스 토큰 접근
        let accessToken = instance.accessToken
        let accessTokenExpireDate = instance.accessTokenExpireDate
        print("Naver Access Token is: \(accessToken), expire: \(accessTokenExpireDate)")
        
        // 서버에 로그인 요청
        if let accessToken = instance.accessToken {
            MoyaProvider<UserApiClient>().request(.naverLogin(accessToken: accessToken)) { result in
                switch result {
                case .success(let response):
                    do {
                        let jsonDictionary = try response.mapJSON() as? [String: Any]
                        print(jsonDictionary)
                        DeepLinkHelper.openLoginResume()
                    } catch {
                        
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    // 토큰 갱신시
    func oauth20ConnectionDidFinishRequestACTokenWithRefreshToken() {
        guard let instance = NaverThirdPartyLoginConnection.getSharedInstance() else { return }
        
        let accessToken = instance.accessToken
        let accessTokenExpireDate = instance.accessTokenExpireDate
        print("Naver Refreshed access token is: \(accessToken), expire: \(accessTokenExpireDate)")
        
        if let accessToken = instance.accessToken {
            MoyaProvider<UserApiClient>().request(.naverLogin(accessToken: accessToken)) { result in
                switch result {
                case .success(let response):
                    DeepLinkHelper.openLoginResume()
                    print(response)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    // 로그아웃(토큰 삭제)시
    func oauth20ConnectionDidFinishDeleteToken() {
        print("delete token")
    }
    
    // Error 발생
    func oauth20Connection(_ oauthConnection: NaverThirdPartyLoginConnection!, didFailWithError error: Error!) {
        print("error")
    }
}
