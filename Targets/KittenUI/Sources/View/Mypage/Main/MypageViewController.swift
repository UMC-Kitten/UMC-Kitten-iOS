//
//  MypageViewController.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/15/24.
//

import UIKit

import KittenService

import SnapKit
import RxSwift
import RxGesture
import ReactorKit

final public class MypageViewController: BaseViewController {
    
    // MARK: Dependency
    private let reactor = MypageReactor(mypageRepository: MypageRemoteRepository())
    
    // MARK: UI Container
    private let scrollView = UIScrollView()
    private let contentView = UIView()
    
    // MARK: UI Component
    private let profileSection = ProfileSection()
    private let mypageMenuSection = MypageMenuSection()
    private let versionLabel: UILabel = .init(staticText: "앱버전 1.0.0")
    
    // MARK: Constructor
    public override func viewDidLoad() {
         super.viewDidLoad()
     }
    
    // MARK: Set Properties
    override func setStyle() {
        
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        
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
            $0.bottom.equalToSuperview()
        }
    }
    
    override func setBind() {
        
        // - data binding
        // 프로필 부분 바인딩
        reactor.state
            .map { $0.user }
            .filterNil()
            .withUnretained(self)
            .subscribe(onNext: { (self, userModel) in
                self.profileSection.configure(
                    profileImage: userModel.profileImage ?? "",
                    nickname: userModel.nickname,
                    pets: userModel.pets
                )
            })
            .disposed(by: disposeBag)
        
        // - action binding
        // 데이터 로드 시점 바인딩
        rx.viewWillAppear
            .map { _ in .viewWillAppear }
            .bind(to: reactor.action)
            .disposed(by: disposeBag)
        
        // 관리 버튼 탭
        profileSection.managementButton.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushView(vc: MyPetSettingViewController())
            }
            .disposed(by: self.disposeBag)
        
        // 내 정보 메뉴 탭
        mypageMenuSection.myInfoSetting.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushView(vc: MyInfoViewController())
            }
            .disposed(by: self.disposeBag)
        
        // 내 게시글 메뉴 탭
        mypageMenuSection.myArticleSetting.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushView(vc: MyArticleSettingViewController())
            }
            .disposed(by: self.disposeBag)
        
        // FAQ 메뉴 탭
        let faqUrl = URL(string: "https://little-pewter-b0f.notion.site/FAQ-c941c491058048cfa81d66960dd9f804?pvs=4")!
        mypageMenuSection.faq.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushWebView(faqUrl)
            }
            .disposed(by: self.disposeBag)
        
        // 공지사항 메뉴 탭
        let noticeUrl = URL(string: "https://little-pewter-b0f.notion.site/dae217c2c1b64eb9b9975ffab538d625?pvs=4")!
        mypageMenuSection.notice.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushWebView(noticeUrl)
            }
            .disposed(by: self.disposeBag)
        
        // 서비스 문의 메뉴 탭
        let inquiryUrl = URL(string: "https://little-pewter-b0f.notion.site/ed8b776d39ec42e5a85013907b6d0cae?pvs=4")!
        mypageMenuSection.inquiry.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushWebView(inquiryUrl)
            }
            .disposed(by: self.disposeBag)
        
        // 서비스 이용약관 메뉴 탭
        let termsUrl = URL(string: "https://little-pewter-b0f.notion.site/73f7d20826f345d09e50ac3f8caa7f1b?pvs=4")!
        mypageMenuSection.terms.rx.tapGesture()
            .dropFirst()
            .withUnretained(self)
            .subscribe { _ in
                self.pushWebView(termsUrl)
            }
            .disposed(by: self.disposeBag)
        
        
    }
}
