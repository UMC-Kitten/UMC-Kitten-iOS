//
//  AppleAuthHelper.swift
//  UMC-Kitten-iOS
//
//  Created by 준호 on 2/17/24.
//

import Foundation
import AuthenticationServices

class AppleAuthHelper: NSObject, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {
    
    // 애플 로그인을 시작하는 메서드
    func startAppleLogin() {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        request.requestedScopes = [.fullName, .email]

        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        print("start apple login")
    }

    // 로그인 성공 시 호출되는 메서드
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
            // 사용자 정보 처리
            let userIdentifier = appleIDCredential.user
            let fullName = appleIDCredential.fullName
            let email = appleIDCredential.email
            let identityToken = String(data: appleIDCredential.identityToken!, encoding: .utf8)
            let authorizationCode = String(data: appleIDCredential.authorizationCode!, encoding: .utf8)
            
            // 테스팅
            print(userIdentifier)
            print(fullName)
            print(email)
            print(identityToken ?? "")
            print(authorizationCode ?? "")
        }
    }

    // 로그인 실패 시 호출되는 메서드
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("apple error: \(error)")
        // 에러 처리
    }

    // ASAuthorizationController를 표시할 때, 어떤 window를 사용할지 결정하는 메서드
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.windows.first { $0.isKeyWindow }!
    }
}
