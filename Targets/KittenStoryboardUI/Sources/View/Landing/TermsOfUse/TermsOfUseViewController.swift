//
//  TermsOfUseViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

class TermsOfUseViewController: UIViewController {
    
    @IBOutlet weak var checkbox1: CheckBox!
    @IBOutlet weak var checkbox2: CheckBox!
    @IBOutlet weak var checkbox3: CheckBox!
    @IBOutlet weak var proceedButton: UIButton!
    
    var checkedOne = false
    var checkedTwo = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        proceedButton.isEnabled = false
        proceedButton.backgroundColor = .grayScale200
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapOne(_:)))
        checkbox1.addGestureRecognizer(tapGesture)
        
        let tapGesturetwo = UITapGestureRecognizer(target: self, action: #selector(handleTapTwo(_:)))
        checkbox2.addGestureRecognizer(tapGesturetwo)
    }
    
    
    @objc func handleTapOne(_ sender: UITapGestureRecognizer) {
        checkbox1.checked.toggle()
        
        if (checkbox1.checked && checkbox2.checked) {
            proceedButton.isEnabled = true
            proceedButton.backgroundColor = .main
        } else {
            proceedButton.isEnabled = false
            proceedButton.backgroundColor = .grayScale200
        }
    }
    
    @objc func handleTapTwo(_ sender: UITapGestureRecognizer) {
        checkbox2.checked.toggle()
        
        if (checkbox1.checked && checkbox2.checked) {
            proceedButton.isEnabled = true
            proceedButton.backgroundColor = .main
        } else {
            proceedButton.isEnabled = false
            proceedButton.backgroundColor = .grayScale200
        }
    }
    
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "OwnerSelect", bundle: nil)
        let ownerSelectViewController = storyboard.instantiateViewController(withIdentifier: "OWNERSELECT") as! OwnerSelectViewController
        
        self.navigationController?.pushViewController(ownerSelectViewController, animated: true)
    }
}
