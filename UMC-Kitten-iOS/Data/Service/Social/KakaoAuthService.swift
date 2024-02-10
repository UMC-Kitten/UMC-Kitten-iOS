//
//  KakaoLoginService.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/10/24.
//

import KakaoSDKAuth
import KakaoSDKUser

class KakaoAuthService {
    func openKakaoTalkLogin(completion: @escaping (String) -> Void) {
        if (UserApi.isKakaoTalkLoginAvailable()) {
            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
                if let error = error {
                    print(error)
                }
                else {
                    print("loginWithKakaoTalk() success.")

                    completion(oauthToken!.accessToken)
                    _ = oauthToken
                }
            }
        }
    }
}
