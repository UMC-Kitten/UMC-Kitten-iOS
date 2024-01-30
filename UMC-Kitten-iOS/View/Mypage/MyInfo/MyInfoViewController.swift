//
//  MyInfoViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import Foundation
import UIKit

import SnapKit
import RxSwift
import RxGesture
import ReactorKit

class MyInfoViewController: BaseViewController{
    
    // MARK: Dependency
    
    private let reactor = MyInfoReactor()
    private let imagePicker = UIImagePickerController()
    
    // MARK: UI Component
    
    private let profileImageSection: ProfileImageSection = .init()
    private let myInfoMenuSection: MyInfoMenuSection = .init()
    private let logoutButton: UILabel = .init(text: "로그아웃")
    private let deleteAccountButton: UILabel = .init(text: "| 회원탈퇴")
    
    
    // MARK: Set Method
    
    override func setStyle() {
        self.title = "내 정보 관리"
        
        logoutButton.setDefaultFont(size: 13)
        logoutButton.textColor = .grayScale500
        
        deleteAccountButton.setDefaultFont(size: 13)
        deleteAccountButton.textColor = .grayScale500
        
    }
    
    override func setDelegate() {
        self.reactor.viewController = self
        self.imagePicker.delegate = self
    }
    
    override func setHierarchy() {
        [profileImageSection, myInfoMenuSection,
         logoutButton, deleteAccountButton]
            .forEach { view.addSubview($0) }
    }
    
    override func setLayout() {
        profileImageSection.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.equalToSuperview()
        }
        
        myInfoMenuSection.snp.makeConstraints {
            $0.top.equalTo(profileImageSection.snp.bottom)
            $0.leading.trailing.equalToSuperview()
        }
        
        logoutButton.snp.makeConstraints {
            $0.bottom.leading.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        deleteAccountButton.snp.makeConstraints {
            $0.leading.equalTo(logoutButton.snp.trailing).offset(5)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
    }
    
    override func setBind() {
        Observable.merge(
            profileImageSection.profileImage.rx.tapGesture().map { $0 },
            profileImageSection.editButton.rx.tapGesture().map { $0 }
        )
        .skip(2)
        .withUnretained(self)
        .subscribe{ _ in
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
        }
        .disposed(by: disposeBag)
        
        myInfoMenuSection.nicknameSettingMenu.rx.tapGesture()
            .skip(1)
            .withUnretained(self)
            .subscribe { _ in
                self.pushView(vc: NicknameSettingViewController())
            }
            .disposed(by: self.disposeBag)
        
        myInfoMenuSection.ownerSettingMenu.rx.tapGesture()
            .skip(1)
            .withUnretained(self)
            .subscribe { _ in
                self.pushView(vc: OwnerSettingViewController())
            }
            .disposed(by: self.disposeBag)
        
        reactor.state.map { $0.profileImage }
            .distinctUntilChanged()
            .bind(to: profileImageSection.profileImage.rx.image)
            .disposed(by: disposeBag)
    }
    
}

extension MyInfoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        var newImage: UIImage? = nil
        
        if let possibleImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newImage = possibleImage
        }
        
        Observable.just(newImage!)
            .map { .updateProfileImage($0) }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        picker.dismiss(animated: true, completion: nil) // picker를 닫아줌
        
    }
}
