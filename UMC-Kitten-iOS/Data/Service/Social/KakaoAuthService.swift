//
//  KakaoLoginService.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import Foundation

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthService {
    static func initializeKakaoAuthSdk() {
        guard let kakaoAuthAppKey = Bundle.main.object(forInfoDictionaryKey: "KAKAO_AUTH_APP_KEY") as? String else {
            fatalError("KAKAO_AUTH_APP_KEY is not set in Info.plist")
        }
        
        KakaoSDK.initSDK(appKey: kakaoAuthAppKey)
    }
    
    func openKakaoTalkLogin(completion: @escaping (String) -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                print(oauthToken)
                if let error = error {
                    print("kakao login error: \(error)")
                }
                else {
                    completion(oauthToken?.accessToken ?? "")
                }
            }
        }
    }
}
