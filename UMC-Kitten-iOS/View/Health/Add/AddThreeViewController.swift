//
//  AddThreeViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 2/16/24.
//

import UIKit

class AddThreeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func dateButton(_ sender: UIButton) {
        let datePickerVC = DatePickerViewController()
        datePickerVC.modalPresentationStyle = .overFullScreen
        datePickerVC.completion = { date in
            // 사용자가 날짜를 선택하고 "확인"을 누른 후 실행할 코드
            let formatter = DateFormatter()
            formatter.dateStyle = .medium
            formatter.timeStyle = .none
            print("선택된 날짜: \(formatter.string(from: date))")
        }
        present(datePickerVC, animated: true, completion: nil)
    }
}
