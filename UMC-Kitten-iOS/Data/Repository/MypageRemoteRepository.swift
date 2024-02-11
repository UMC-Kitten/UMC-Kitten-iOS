//
//  MypageRemoteRepository.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/12/24.
//

import Foundation

/// 마이페이지 관련 데이터 동작을 서버 API를 이용해 실행
class MypageRemoteRepository: MypageRepository {
    
    private let client = BaseMoyaProvider<MypageApiClient>().provider
    
    func getInfo(completion: @escaping (_ user: Any?, _ error: Any?) -> Void) {
        let userId = Int64(UserDefaults.standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        client.request(.getInfo(id: userId)) { result in
            switch result {
            case .success(let response):
                // TODO: response.data를 Dto로 변환
                // TODO: Dto를 도메인 객체로 변환 후 전달
                print(response)
            case .failure(let error):
                // TODO: 에러 Enum으로 정의해서 처리
                print(error)
            }
        }
    }
    
}
