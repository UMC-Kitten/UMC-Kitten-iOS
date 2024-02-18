//
//  StartScreenViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

import SnapKit
import Moya

class StartScreenViewController: UIViewController {
    
    @IBOutlet weak var logoImage: UIImageView!
    let kakaoLoginButton: UIImageView = .init(imageName: "kakao-login-button")
    let naverLoginButton: UIImageView = .init(imageName: "naver-login-button")
    let appleLoginButton: UIImageView = .init(imageName: "apple-login-button")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        [kakaoLoginButton, naverLoginButton, appleLoginButton]
            .forEach{
                view.addSubview($0)
                $0.isUserInteractionEnabled = true
                $0.layer.cornerRadius = 5
            }
        
        kakaoLoginButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(logoImage.snp.bottom).offset(20)
            $0.height.equalTo(50)
        }
        
        naverLoginButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(kakaoLoginButton.snp.bottom).offset(15)
            $0.height.equalTo(50)
        }
        
        appleLoginButton.snp.makeConstraints {
            $0.left.right.equalToSuperview().inset(20)
            $0.top.equalTo(naverLoginButton.snp.bottom).offset(15)
            $0.height.equalTo(50)
        }
        
        kakaoLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goKakaoLogin(_:))))
        naverLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goNaverLogin(_:))))
        appleLoginButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(goAppleLogin(_:))))
    }
    
    @objc func goKakaoLogin(_ sender: UIView) {
        KakaoAuthHelper.openKakaoTalkLogin() { token in
            MoyaProvider<UserApiClient>().request(.kakaoLogin(accessToken: token)) { result in
                switch result {
                case .success(let response):
                    do {
                        let responseJson = try response.mapJSON() as! [String: Any]
                        let result = responseJson["result"] as! [String: Any]
                        let userId: Int64 = result["id"] as! Int64
                        UserDefaults.standard.setValue(userId, forKey: UserDefaultsConstant.USER_ID_KEY)
                        DeepLinkHelper.openLoginResume()
                    } catch {}
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
    
    @objc func goNaverLogin(_ sender: UIView) {
        NaverAuthHelper.openNaverLogin()
    }
    
    @objc func goAppleLogin(_ sender: UIView) {
        AppleAuthHelper().startAppleLogin()
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let signUpViewController = storyboard.instantiateViewController(withIdentifier: "SIGNUP") as! SignUpViewController
        
        self.navigationController?.pushViewController(signUpViewController, animated: true)
    }
    
}
