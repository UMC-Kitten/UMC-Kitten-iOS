//
//  PetSelectViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/27/24.
//

import UIKit

class PetSelectViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "PetTypeSelect", bundle: nil)
        let petTypeSelectViewController = storyboard.instantiateViewController(withIdentifier: "PETTYPESELECT") as! PetTypeSelectViewController
        
        self.navigationController?.pushViewController(petTypeSelectViewController, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
