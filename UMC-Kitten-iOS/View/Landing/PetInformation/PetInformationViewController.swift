//
//  petInformationViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/29/24.
//

import UIKit

class PetInformationViewController: UIViewController, PetSelectionDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
    
    var selectPet: String?
    
    func didSelectPet(_ pet: String) {
        self.selectPet = pet
    }
    
    @IBOutlet weak var imageView: UIImageView!
    
    let imagepicker = UIImagePickerController()
    var isCameraAvailble = false
    
    var selectGender: String?
    
    @IBOutlet weak var petName: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var petImageOne: UIImageView!
    @IBOutlet weak var petImageTwo: UIImageView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    @IBOutlet weak var extraNote: UITextField!
    @IBOutlet weak var birthDay: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFirstView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOne(_:)))
        firstView.addGestureRecognizer(tapGesture)
        
        let tapGesturetwo = UITapGestureRecognizer(target: self, action: #selector(handleTapTwo(_:)))
        secondView.addGestureRecognizer(tapGesturetwo)
        
        firstView.layer.shadowColor = UIColor.black.cgColor
        firstView.layer.shadowOpacity = 0.25
        firstView.layer.shadowOffset = CGSize(width: 2, height: 2)
        firstView.layer.shadowRadius = 4.0
        firstView.layer.cornerRadius = 5
        
        self.view.addSubview(firstView)
        
        secondView.layer.shadowColor = UIColor.black.cgColor
        secondView.layer.shadowOpacity = 0.25
        secondView.layer.shadowOffset = CGSize(width: 2, height: 2)
        secondView.layer.shadowRadius = 4.0
        secondView.layer.cornerRadius = 5
        
        self.view.addSubview(secondView)
        
        nextButton.layer.cornerRadius = 5
        
        let note = extraNote.text ?? ""
        birthDay.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        
    }
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        popup()
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let selectedDate = sender.date
    }
    
    @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
        showFirstView()
        print("first tap")
        selectGender = "MALE"
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        showSecondView()
        print("second tap")
        selectGender = "FEMALE"
    }
    
    // 첫 번째 UIView를 보여주는 메서드
    private func showFirstView() {
        firstView.backgroundColor = UIColor.appButton
        secondView.backgroundColor = .white
        labelOne.textColor = .white
        labelTwo.textColor = .black
    }
    
    // 두 번째 UIView를 보여주는 메서드
    private func showSecondView() {
        firstView.backgroundColor = .white
        secondView.backgroundColor = UIColor.appButton
        labelOne.textColor = .black
        labelTwo.textColor = .white
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
        let welcomeViewController = storyboard.instantiateViewController(withIdentifier: "WELCOME") as! WelcomeViewController
        
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
    
    func popup() {
        
        let alertController = UIAlertController(title: "프로필 이미지 등록", message: nil, preferredStyle: .actionSheet)
        let camera = UIAlertAction(title: "사진 촬영", style: .default) { (_) in
            self.imagepicker.sourceType = .camera
            self.imagepicker.allowsEditing = false
            self.imagepicker.delegate = self
            self.present(self.imagepicker, animated: true, completion:  nil)
        }
        let library = UIAlertAction(title: "앨범에서 선택", style: .default) { (_) in
            self.imagepicker.sourceType = .photoLibrary
            self.imagepicker.allowsEditing = false
            self.imagepicker.delegate = self
            self.present(self.imagepicker, animated: true, completion: nil)
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel) { (_) in
            // self.dismiss(animated: true, completion: nil)
        }
        
        if isCameraAvailble == true {
            alertController.addAction(camera)
        }
        alertController.addAction(library)
        alertController.addAction(cancel)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let safeImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = safeImage
        }
        
        imagepicker.dismiss(animated: true, completion: nil)
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
            "type": selectPet ?? "", // DOG or CAT
            "name": petName.text ?? "",
            "petProfileImage": "sample.jpg", // 아직 이미지 API 없어서 아무 문자열이나
            "gender": selectGender ?? "", // MALE or FEMALE
            "notes": extraNote.text ?? ""
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
}
