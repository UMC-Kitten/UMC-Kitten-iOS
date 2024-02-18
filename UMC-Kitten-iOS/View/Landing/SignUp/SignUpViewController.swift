import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{
    
    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    var name: String = ""
    var userInfo: ((UserInfo) -> Void)?
    var textFields: [UITextField] {
        [nameTextField]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        
        setupTextField()
        
        self.setupHideKeyboardOnTap() // 화면 탭 시 키보드 숨기기 설정
        
        self.navigationController?.interactivePopGestureRecognizer?.delegate = nil // 뒤로가기 슬라이드 버그 픽스
        
        
    }
    
    
    @IBAction func backButton(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    //MARK: - 화면 전환
    @IBAction func nextViewButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "SignUpProfileImage", bundle: nil)
        let signUpProfileImageViewController = storyboard.instantiateViewController(withIdentifier: "SIGNUPPROFILEIMAGE") as! SignUpProfileImageViewController
        
        self.navigationController?.pushViewController(signUpProfileImageViewController, animated: true)
        
        let userInfo = UserInfo(name: self.name)
        self.userInfo?(userInfo)
        
    }
    
    
    
    //MARK: - 화면 누를시 키보드 숨기기
    func setupHideKeyboardOnTap() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    //MARK: - Label에서 '닉네임'만 볼드 처리
    
    func changeTextSize() {
        guard let text = self.introLabel.text else { return }
        
        let fontSIze = UIFont.boldSystemFont(ofSize: 24)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: fontSIze, range: (text as NSString).range(of:"나는 집사"))
        
        self.introLabel.attributedText = attributeString
    }
    
    /* private func setupAtrribute() {
     
     let text1 = "환영합니다."
     let text2 = "나는집사"
     let text3 = "입니다. 어떻게 불러드리면 될까요?"
     
     let font1 = UIFont.systemFont(ofSize: 22)
     let font2 = UIFont.systemFont(ofSize: 23)
     let font3 = UIFont.systemFont(ofSize: 22)
     
     let attributes = generateButtonAttribute(self.introLabel, texts: text1, text2, text3, fonts: font1, font2, font3)
     
     self.introLabel.setAttributedTitle(attributes, for: .normal)
     }
     */
    //MARK: - Textfield의 텍스트를 15개로 제한하기
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let range = Range(range, in : currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        return updatedText.count <= 15
    }
    // MARK: - 유효성 검사
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case nameTextField:
            self.isValidName = text.count > 2
            self.name = text
        default:
            fatalError("Missing TextField...")
        }
    }
    
    private func setupTextField() {
        
        textFields.forEach {tf in
            tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        }
    }
    
    private func validateUserInfo() {
        if isValidName {
            self.nextButton.backgroundColor = UIColor.appButton
            nextButton.isEnabled = true
        } else {
            self.nextButton.backgroundColor = UIColor.lightGray
            nextButton.isEnabled = false
        }
    }
    
    
    //MARK: - 유효성 검사
    //무엇인가 잘못된 코드...
    /*
     extension String{
     func isValidname() -> Bool {
     
     let nameRegEx = "[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{1,15}"
     let nameTest = NSPredicate(format:"SELF MATCHES %@", nameRegEx)
     
     return nameTest.evaluate(with: self)
     }
     }
     */
    
}
