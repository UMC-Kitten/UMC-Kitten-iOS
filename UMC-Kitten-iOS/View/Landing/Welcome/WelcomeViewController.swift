//
//  WelcomeViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/30/24.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    let mypageRepository = MypageRemoteRepository()
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nickNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchUser()
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func fetchUser() {
        mypageRepository.getUserInfo() { user, error in
            print(user)
            print(error)
            if let user = user {
                self.nickNameLabel.text = "\(user.nickname)님"
                ImageProvider.loadImage(user.profileImage ?? "") { image in
                    DispatchQueue.main.async {
                        self.profileImageView.image = image
                    }
                }
            }
        }
    }
}
