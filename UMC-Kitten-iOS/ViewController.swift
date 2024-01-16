//
//  ViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/11/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UILabel 생성 및 설정
        let label = UILabel()
        // 폰트 설정 법
        label.setDefaultFont(weight: .black)
        label.setDefaultFont(size: 20, weight: .black)
        // 컬러 사용 법
        label.textColor = .grayScale400
        label.textColor = .mainDeep
        label.text = "안녕하세요, iOS 개발!"
        label.textAlignment = .center
        
        // 레이블을 뷰에 추가
        view.addSubview(label)
        
        // 레이블의 오토레이아웃 설정
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }


}

