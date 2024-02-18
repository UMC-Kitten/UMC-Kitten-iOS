//
//  OwnerSelectViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

class OwnerSelectViewController: UIViewController {
    
    var selectedView: UIView?
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var petImageOne: UIImageView!
    @IBOutlet weak var petImageTwo: UIImageView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            
            // 첫 번째 UIView를 보여줌
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
        
        }

    
        @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
            showFirstView()
            print("first tap")
            selectedView = firstView
        }
    
        @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
            showSecondView()
            print("second tap")
            selectedView = secondView
        }

        // 첫 번째 UIView를 보여주는 메서드
        private func showFirstView() {
            firstView.backgroundColor = UIColor.appButton
            secondView.backgroundColor = .white
            petImageOne.image = UIImage(named: "animalWhite")
            petImageTwo.image = UIImage(named: "customPersonBlack")
            labelOne.textColor = .white
            labelTwo.textColor = .black
            
        }

        // 두 번째 UIView를 보여주는 메서드
        private func showSecondView() {
            firstView.backgroundColor = .white
            secondView.backgroundColor = UIColor.appButton
            petImageOne.image = UIImage(named: "animalBlack")
            petImageTwo.image = UIImage(named: "customPersonWhite")
            labelOne.textColor = .black
            labelTwo.textColor = .white
            
        }
    @IBAction func goNextButton(_ sender: UIButton) {
        let hasPet = selectedView === firstView ? true : false
        MypageRemoteRepository().changeHasPet(hasPet: hasPet) { [weak self] result, error in
            if let error = error {
                print("Landing page change has pet error: \(error)")
                return
            }
            
            if self?.selectedView == self?.firstView {
                self?.navigateToFirstView()
            } else if self?.selectedView == self?.secondView {
                self?.navigateToSecondView()
            }
        }
    }
    
    func navigateToFirstView() {
        let storyboard = UIStoryboard(name: "PetSelect", bundle: nil)
        let petSelectViewController = storyboard.instantiateViewController(withIdentifier: "PETSELECT") as! PetSelectViewController
        
        self.navigationController?.pushViewController(petSelectViewController, animated: true)
    }
    
    func navigateToSecondView() {
        let storyboard = UIStoryboard(name: "Welcome", bundle: nil)
        let welcomeViewController = storyboard.instantiateViewController(withIdentifier: "WELCOME") as! WelcomeViewController
        
        self.navigationController?.pushViewController(welcomeViewController, animated: true)
    }
}


