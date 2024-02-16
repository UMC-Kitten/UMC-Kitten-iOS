//
//  petInformationViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/29/24.
//

import UIKit

class PetInformationViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var petImageOne: UIImageView!
    @IBOutlet weak var petImageTwo: UIImageView!
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    
    
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
        
    }
    
    
    @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
        showFirstView()
        print("first tap")
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        showSecondView()
        print("second tap")
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
    
}
