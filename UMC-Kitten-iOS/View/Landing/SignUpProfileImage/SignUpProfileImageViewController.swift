import UIKit

class SignUpProfileImageViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var introduceLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    let imagepicker = UIImagePickerController()
    var isCameraAvailble = false
    
    var receivedText: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.changeTextSize()
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            isCameraAvailble = true
            
            // registerViewController.userInfo = { (userInfo) in print(userInfo)}
        }
    }
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "TermsOfUse", bundle: nil)
        let termsOfUseViewController = storyboard.instantiateViewController(withIdentifier: "TERMSOFUSE") as! TermsOfUseViewController
        
        self.navigationController?.pushViewController(termsOfUseViewController, animated: true)
    }
    
    
    
    @IBAction func touchUpShowActionSheetButton(_ sender: UIButton) {
        popup()
    }
    
    
    func changeTextSize() {
        guard let text = self.nameLabel.text else { return }
        
        let fontSIze = UIFont.boldSystemFont(ofSize: 24)
        let attributeString = NSMutableAttributedString(string: text)
        
        attributeString.addAttribute(.font, value: fontSIze, range: (text as NSString).range(of:"닉네임"))
        
        self.nameLabel.attributedText = attributeString
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
}
