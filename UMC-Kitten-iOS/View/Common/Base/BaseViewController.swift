//
//  BaseViewController.swift
//  HumanscapeShoppingMall
//
//  Created by DOYEON LEE on 2023/05/30.
//

import Foundation
import UIKit

import RxSwift

protocol BaseViewControllerProtocol: AnyObject {
    func setStyle()
    func setDelegate()
    func setHierarchy()
    func setLayout()
    func setBind()
}

class BaseViewController: UIViewController, BaseViewControllerProtocol {
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setStyle()
        setDelegate()
        setHierarchy()
        setLayout()
        setBind()
    }
    

    func setStyle() { }
    
    func setDelegate() { }
    
    func setHierarchy() { }
    
    func setLayout() { }
    
    func setBind() { }
}

extension BaseViewController {
    func pushView(vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func configureNavigationBarTransparentAndTitleless() {
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.topItem?.title = ""
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance.backgroundColor = .white
        navigationController?.navigationBar.standardAppearance.shadowColor = .clear
    }
}


/// 복붙용 예시입니다
class sampleViewController: BaseViewController {
    
    override func setStyle() { }
    
    override func setDelegate() { }
    
    override func setHierarchy() { }
    
    override func setLayout() { }
    
    override func setBind() { }
    
}
