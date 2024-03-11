//
//  MyPetAddCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import UIKit

public class MyPetAddCell: BaseCollectionViewCell {
    
    public var parentViewController: UIViewController?
    
    // MARK: UI Component
    let plusImage: UIImageView = .init(image: UIImage(systemName: "plus")!)
    
    // MARK: Set Methods
    public override func setStyle() {
        layer.cornerRadius = 10
        layer.borderWidth = 2
        layer.borderColor = UIColor.grayScale100.cgColor
        
        plusImage.tintColor = .main
        plusImage.contentMode = .scaleAspectFit
        
        setupTapGesture()
    }
    
    public override func setHierarchy() {
        [plusImage]
            .forEach { addSubview($0)}
    }
    
    public override func setLayout() {
        plusImage.snp.makeConstraints {
            $0.centerY.centerX.equalToSuperview()
            $0.height.width.equalTo(40)
        }
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.isUserInteractionEnabled = true
        self.addGestureRecognizer(tapGesture)
    }
    
    @objc func handleTap() {
        // FIXME: 모듈 순환참조 문제
//        let sb = UIStoryboard(name: "PetInformation", bundle: nil)
//        guard let vc = sb.instantiateViewController(withIdentifier: "PETINFORMATION")
//                as? PetInformationViewController else { return }
//        
//        self.parentViewController?.navigationController?
//            .pushViewController(vc, animated: true)
    }
}
