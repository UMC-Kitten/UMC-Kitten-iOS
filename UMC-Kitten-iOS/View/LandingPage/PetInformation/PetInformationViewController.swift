//
//  petInformationViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/29/24.
//

import UIKit

class PetInformationViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        requestAddPet()
    }
    
    // TODO: 버튼 탭 이벤트에 이 함수를 넣어주세요
    func requestAddPet() {
        // 디바이스에 저장된 jwt 가져오기
        let token = UserDefaults.standard.string(forKey: UserDefaultsConstant.JWT_KEY)!
        
        // 디바이스에 저장된 user id 가져오기
        let userId = Int64(UserDefaults.standard.integer(forKey: UserDefaultsConstant.USER_ID_KEY))
        
        // API 요청을 보낼 URL
        let apiUrl = URL(string: "http://localhost:8080/api/v1/\(userId)/pet")! // user id는 path parameter
        
        // 요청 바디 생성
        // 이 api가 배열이 루트인 값을 받게 설계되어 있어서 [[String: Any]] 형입니다.
        // 만약 json 형태로 시작한다면 [String: Any] 형으로 쓰시면 됩니다.
        // TODO: IBOutlet으로 받은 값으로 바꿔주세요
        let requestBody: [[String: Any]] = [[
            "type": "DOG", // DOG or CAT
            "name": "초코",
            "petProfileImage": "sample.jpg", // 아직 이미지 API 없어서 아무 문자열이나
            "gender": "MALE", // MALE or FEMALE
            "notes": "귀여운 강아지"
        ]]
        
        // 요청 생성
        var request = URLRequest(url: apiUrl)
        request.httpMethod = "POST"
        
        do {
            
            // 헤더에 토큰 추가
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            // 요청 헤더 설정 (예: JSON 형식의 데이터를 전송하는 것을 명시)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // 요청 바디를 JSON 데이터로 변환
            let jsonData = try JSONSerialization.data(withJSONObject: requestBody, options: [])
            
            // 요청 바디 설정
            request.httpBody = jsonData
            
            // 요청 헤더 설정 (예: JSON 형식의 데이터를 전송하는 것을 명시)
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // URLSession 인스턴스 생성
            let session = URLSession.shared
            
            // API 요청 생성
            let task = session.dataTask(with: request) { data, response, error in
                // 에러 처리
                if let error = error {
                    print("Error: \(error.localizedDescription)")
                    return
                }
                
                // 응답 처리
                if let httpResponse = response as? HTTPURLResponse {
                    if !(200...299).contains(httpResponse.statusCode) {
                        print("HTTP Response Error: \(httpResponse.statusCode)")
                        return
                    }
                }
                
                // 데이터 처리
                if let data = data {
                    // 데이터를 JSON 형식으로 파싱하거나 다른 처리 수행
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                           let resultArray = json["result"] as? [[String: Any]] {
                            print("Request state: \(json)")
                            
                            // FIXME: 받은 값을 UI 연결하거나 네비게이션 처리
                            for petDict in resultArray {
                                print("Pet ID: \(petDict["id"])")
                                print("Pet Type: \(petDict["type"])")
                                print("Pet Name: \(petDict["name"])")
                                print("Pet Profile Image: \(petDict["petProfileImage"])")
                                print("Pet Gender: \(petDict["gender"])")
                                print("Pet Notes: \(petDict["notes"])")
                            }
                        }
                    } catch {
                        print("JSON Parsing Error: \(error.localizedDescription)")
                    }
                }
            }
            
            // API 요청 시작
            task.resume()
        } catch {
            print("Error creating JSON data: \(error.localizedDescription)")
        }
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
