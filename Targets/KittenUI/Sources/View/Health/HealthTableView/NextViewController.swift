//
//  NextViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 2/17/24.
//

import UIKit

class NextViewController: UIViewController {
    
    var selectedView: UIView?
    
    @IBOutlet weak var ButtonOne: UIView!
    @IBOutlet weak var ButtonTwo: UIView!
    @IBOutlet weak var ButtonThree: UIView!
    
    @IBOutlet weak var LabelOne: UILabel!
    @IBOutlet weak var LabelTwo: UILabel!
    @IBOutlet weak var LabelThree: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showFirstView()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOne(_:)))
        ButtonOne.addGestureRecognizer(tapGesture)
        
        let tapGesturetwo = UITapGestureRecognizer(target: self, action: #selector(handleTapTwo(_:)))
        ButtonTwo.addGestureRecognizer(tapGesturetwo)
        
        let tapGesturethree = UITapGestureRecognizer(target: self, action: #selector(handleTapThree(_:)))
        ButtonThree.addGestureRecognizer(tapGesturethree)
        
        ButtonOne.layer.shadowColor = UIColor.black.cgColor
        ButtonOne.layer.shadowOpacity = 0.25
        ButtonOne.layer.shadowOffset = CGSize(width: 2, height: 2)
        ButtonOne.layer.shadowRadius = 4.0
        
        self.view.addSubview(ButtonOne)
        
        ButtonTwo.layer.shadowColor = UIColor.black.cgColor
        ButtonTwo.layer.shadowOpacity = 0.25
        ButtonTwo.layer.shadowOffset = CGSize(width: 2, height: 2)
        ButtonTwo.layer.shadowRadius = 4.0
        
        self.view.addSubview(ButtonTwo)
        
        ButtonThree.layer.shadowColor = UIColor.black.cgColor
        ButtonThree.layer.shadowOpacity = 0.25
        ButtonThree.layer.shadowOffset = CGSize(width: 2, height: 2)
        ButtonThree.layer.shadowRadius = 4.0
        
        self.view.addSubview(ButtonThree)
        
    }
    
    
    @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
        showFirstView()
        print("first tap")
        selectedView = ButtonOne
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        showSecondView()
        print("second tap")
        selectedView = ButtonTwo
    }
    
    @objc func handleTapThree(_ sender: UITapGestureRecognizer) {
        showThirdView()
        print("third tap")
        selectedView = ButtonThree
    }
    // 첫 번째 UIView를 보여주는 메서드
    private func showFirstView() {
        ButtonOne.backgroundColor = UIColor.selection
        ButtonTwo.backgroundColor = .white
        ButtonThree.backgroundColor = .white
        
        LabelOne.textColor = .white
        LabelTwo.textColor = .black
        LabelThree.textColor = .black
        
    }
    
    // 두 번째 UIView를 보여주는 메서드
    private func showSecondView() {
        ButtonOne.backgroundColor = .white
        ButtonTwo.backgroundColor = UIColor.selection
        ButtonThree.backgroundColor = .white
        
        LabelOne.textColor = .black
        LabelTwo.textColor = .white
        LabelThree.textColor = .black
    }
    
    private func showThirdView() {
        ButtonOne.backgroundColor = .white
        ButtonTwo.backgroundColor = .white
        ButtonThree.backgroundColor = UIColor.selection
        
        LabelOne.textColor = .black
        LabelTwo.textColor = .black
        LabelThree.textColor = .white
    }
    
    
    @IBAction func goNextButton(_ sender: UIButton) {
            if selectedView == ButtonOne {
                navigateToFirstView()
            } else if selectedView == ButtonTwo {
                navigateToSecondView()
            } else if selectedView == ButtonThree { // 여기서 ButtonTwo가 중복으로 사용되었으며, 아마도 세 번째 조건은 다른 버튼을 의미해야 할 것입니다.
                navigateToThirdView()
            }
        }
    func navigateToFirstView() {
        let storyboard = UIStoryboard(name: "Add", bundle: nil)
        let addViewController = storyboard.instantiateViewController(withIdentifier: "ADD") as! AddViewController
        
        self.navigationController?.pushViewController(addViewController, animated: true)
    }
    
    func navigateToSecondView() {
        let storyboard = UIStoryboard(name: "AddTwo", bundle: nil)
        let addTwoViewController = storyboard.instantiateViewController(withIdentifier: "ADDTWO") as! AddTwoViewController
        
        self.navigationController?.pushViewController(addTwoViewController, animated: true)
    }
    
    func navigateToThirdView() {
        let storyboard = UIStoryboard(name: "AddThree", bundle: nil)
        let addThreeViewController = storyboard.instantiateViewController(withIdentifier: "ADDTHREE") as! AddThreeViewController
        
        self.navigationController?.pushViewController(addThreeViewController, animated: true)
    }
}
