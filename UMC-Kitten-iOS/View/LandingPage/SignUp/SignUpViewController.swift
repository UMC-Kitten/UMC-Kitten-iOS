import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate{

    var isValidName = false {
        didSet {
            self.validateUserInfo()
        }
    }
    
    @IBOutlet weak var introLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    
    var textFields: [UITextField] {
        [nameTextField]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        self.changeTextSize()
        
        setupTextField()
    }
    
    func changeTextSize() {
        guard let text = self.introLabel.text else { return }
        
        let fontSIze = UIFont.boldSystemFont(ofSize: 24)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: fontSIze, range: (text as NSString).range(of:"나는 집사"))
        
        self.introLabel.attributedText = attributeString
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        
        guard let range = Range(range, in : currentText) else { return false }
        
        let updatedText = currentText.replacingCharacters(in: range, with: string)
        
        return updatedText.count <= 15
    }
    
    @objc
    func textFieldEditingChanged(_ sender: UITextField) {
        let text = sender.text ?? ""
        
        switch sender {
        case nameTextField:
            self.isValidName = text.isValidname()
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
        } else {
            self.nextButton.backgroundColor = UIColor.lightGray
        }
    }
}

extension String{
    func isValidname() -> Bool {
        
        let nameRegEx = "[가-힣ㄱ-ㅎㅏ-ㅣa-zA-Z0-9]{1,15}"
        let nameValidation = NSPredicate.init(format: "SELF MATCHES %@", nameRegEx)
        
        return nameValidation.evaluate(with: self)
    }
}
