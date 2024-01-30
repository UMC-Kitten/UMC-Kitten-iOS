//
//  MypageViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/15/24.
//

import UIKit

import SnapKit
import RxSwift
import RxGesture
import ReactorKit

class MypageViewController: BaseViewController {
    
    // MARK: Dependency
    private let reactor = MypageReactor()
    
    // MARK: UI Container
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: UI Component
    private let profileSection = ProfileSection()
    private let mypageMenuSection = MypageMenuSection()
    private let versionLabel: UILabel = .init(text: "앱버전 1.0.0")
    
    // MARK: Constructor
    override func viewDidLoad() {
         super.viewDidLoad()
     }
    
    // MARK: Set Properties
    override func setStyle() {
        
        navigationController?.navigationBar.tintColor = .black
        
        scrollView.backgroundColor = .white
        
        contentView.backgroundColor = .white
        
        versionLabel.setDefaultFont(size: 11)
        versionLabel.textColor = .grayScale500
    }
    
    override func setDelegate() {
        
    }
    
    override func setHierarchy() {
        view.addSubview(scrollView)
        
        scrollView.addSubview(contentView)
        
        [profileSection, mypageMenuSection, versionLabel]
            .forEach { contentView.addSubview($0) }
        
    }
    
    override func setLayout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.width.equalTo(scrollView)
            $0.height.equalTo(900)
        }
        
        profileSection.snp.makeConstraints {
            $0.top.equalToSuperview().offset(-35) // For ignore navgationBar height
            $0.trailing.leading.equalToSuperview().inset(20)
        }
        
        mypageMenuSection.snp.makeConstraints {
            $0.top.equalTo(profileSection.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview()
        }
        
        versionLabel.snp.makeConstraints {
            $0.top.equalTo(mypageMenuSection.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(20)
        }
        
    }
    
    override func setBind() {
        profileSection.managementButton.rx.tapGesture()
            .map { _ in .tapMyPetManagementButton }
            .bind(to: reactor.action)
            .disposed(by: self.disposeBag)
        
        mypageMenuSection.editMyProfile.rx.tapGesture()
            .skip(1)
            .subscribe { _ in
                self.pushView(vc: MyInfoViewController())
            }
            .disposed(by: self.disposeBag)
        
        profileSection.managementButton.rx.tapGesture()
            .skip(1)
            .subscribe { _ in
                self.pushView(vc: MyPetSettingViewController())
            }
            .disposed(by: self.disposeBag)
    }
    
}
