//
//  LoginTestViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/11/24.
//

import UIKit

import Moya
import RxSwift
import SnapKit

import NaverThirdPartyLogin

class LoginTestViewController: BaseViewController {
    
    private let kakaoAuthService = KakaoAuthService()
    private let naverAuthService = NaverAuthService()
    private let userService = MoyaProvider<UserService>()
    
    private let kakaoLoginButton: UIButton = .init(text: "카카오 로그인")
    private let naverLoginButton: UIButton = .init(text: "네이버 로그인")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [kakaoLoginButton, naverLoginButton].forEach { view.addSubview($0) }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
        
        naverLoginButton.snp.makeConstraints {
            $0.center.equalToSuperview().offset(40)
        }
        
        kakaoLoginButton.addTarget(self, action: #selector(kakaoLoginButtonTapped(_:)), for: .touchUpInside)
        naverLoginButton.addTarget(self, action: #selector(naverLoginButtonTapped(_:)), for: .touchUpInside)
        
    }
    
    @objc func kakaoLoginButtonTapped(_ sender: UIButton) {
        // ⚠️ 시뮬레이터에서는 카카오톡 앱 오픈 불가, 디바이스에서는 localhost 접속 불가 문제로
        // 테스트시엔 디바이스에서 카카오톡 Auth token 받아온 후 하드코딩해서 백엔드 API 테스트
        let token = "WzgN79Yv9nnPaEVMhvLejoBwIEQicHpw14KPXUbAAABjZgtIL4h5oEAb4_jFQ"
//        self.kakaoAuthService.openKakaoTalkLogin { token in
            self.userService.request(.kakaoLogin(accessToken: token)) { result in
                switch result {
                case let .success(moyaResponse):
//                    let data = moyaResponse.data.map(ApiResponse<UserResponseDto>.self)
                    let data = try? JSONDecoder().decode(ApiResponse<UserResponseDto>.self, from: moyaResponse.data)
                    let statusCode = moyaResponse.statusCode
                    print("data: \(String(describing: data))")
                    print("statusCode: \(statusCode)")
                case .failure(_): break
                    
                }
            }
//        }
    }
    
    @objc func naverLoginButtonTapped(_ sender: UIButton) {
        /// 예시 토큰 형태
        let token = "AAAANn6_WsR4xr2qo6L_ejN3a8x_U_7mOGKaShVUrIrPXa0Wwp6f7VncoKVbMCz5AlaLJKyedREZQqLPbjN-E-Esvlk"
        // naver app open
        naverAuthService.openNaverLogin()
        
    }
}
