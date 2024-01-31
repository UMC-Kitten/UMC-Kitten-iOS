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
    
    let reactor = MyInfoReactor()
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
            self.showBottomSheet()
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
    
    /// 카메라와 앨범 중 선택하는 bottom sheet입니다.
    private func showBottomSheet() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraAction = UIAlertAction(title: "사진 촬영", style: .default) { _ in
                self.imagePicker.sourceType = .camera
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(cameraAction)
        }

        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let photoLibraryAction = UIAlertAction(title: "앨범", style: .default) { _ in
                self.imagePicker.sourceType = .photoLibrary
                self.present(self.imagePicker, animated: true, completion: nil)
            }
            alertController.addAction(photoLibraryAction)
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
    }
    
}

