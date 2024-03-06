//
//  petTypeSelectViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/29/24.
//

import UIKit

protocol PetSelectionDelegate: AnyObject {
    func didSelectPet(_ pet: String)
}

class PetTypeSelectViewController: UIViewController {
    
    weak var delegate: PetSelectionDelegate?
    var selectPet: String?
    
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
        selectPet = "DOG"
        delegate?.didSelectPet(selectPet!)
        print("first tap")
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        showSecondView()
        selectPet = "CAT"
        delegate?.didSelectPet(selectPet!)
        print("second tap")
    }
    
    // 첫 번째 UIView를 보여주는 메서드
    private func showFirstView() {
        firstView.backgroundColor = UIColor.main
        secondView.backgroundColor = .white
        petImageOne.image = UIImage(named: "dogWhite")
        petImageTwo.image = UIImage(named: "catBlack")
        labelOne.textColor = .white
        labelTwo.textColor = .black
        
    }
    
    // 두 번째 UIView를 보여주는 메서드
    private func showSecondView() {
        firstView.backgroundColor = .white
        secondView.backgroundColor = UIColor.main
        petImageOne.image = UIImage(named: "dogBlack")
        petImageTwo.image = UIImage(named: "CatWhite")
        labelOne.textColor = .black
        labelTwo.textColor = .white
        
    }
    
    @IBAction func nextViewButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PetInformation", bundle: nil)
        let petInformationViewController = storyboard.instantiateViewController(withIdentifier: "PETINFORMATION") as! PetInformationViewController
        
        self.navigationController?.pushViewController(petInformationViewController, animated: true)
    }
}
