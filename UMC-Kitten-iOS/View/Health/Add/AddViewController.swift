//
//  AddViewController.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 2/10/24.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet weak var goButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        goButton.addTarget(self, action: #selector(showBottomSheet), for: .touchUpInside)
        
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handleDismissalPanGesture))
                view.addGestureRecognizer(panGestureRecognizer)
        
    }
    
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
    
    func handleDateSelection(date: Date) {
        // 날짜 선택 로직 처리
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        print("선택된 날짜: \(formatter.string(from: date))")
    }
    
    @objc func showBottomSheet() {
        // Bottom sheet로 사용할 뷰 컨트롤러 인스턴스를 생성
        let bottomSheetVC = BottomSheetViewController()
        
        // 커스텀 프레젠테이션을 위한 설정
        bottomSheetVC.modalPresentationStyle = .custom
        bottomSheetVC.transitioningDelegate = self // self는 UIViewControllerTransitioningDelegate 프로토콜을 준수하는 객체여야 합니다.
        
        // 뷰 컨트롤러를 현재 뷰 컨트롤러 위에 표시
        present(bottomSheetVC, animated: true)
        }
    
    @objc func handleDismissalPanGesture(gestureRecognizer: UIPanGestureRecognizer) {
            let translation = gestureRecognizer.translation(in: view)
            let velocity = gestureRecognizer.velocity(in: view)

            switch gestureRecognizer.state {
            case .changed:
                // If the user is dragging down, update the view's position
                if translation.y > 0 {
                    view.frame.origin.y = translation.y
                }
            case .ended:
                // If the user lifted their finger and the velocity is high, or they've dragged down enough, dismiss the view
                if velocity.y > 1500 || translation.y > view.frame.height / 2 {
                    dismiss(animated: true)
                } else {
                    // If not dismissed, animate the view back to its original position
                    UIView.animate(withDuration: 0.3) {
                        self.view.frame.origin.y = 0
                    }
                }
            default:
                break
            }
        }
    
    
    
}

extension AddViewController: UIViewControllerTransitioningDelegate {
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        // 여기서 CustomPresentationController를 초기화하고 반환합니다.
        return CustomPresentationController(presentedViewController: presented, presenting: presenting, height: 300)
    }
}
