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

open class BaseViewController: UIViewController, BaseViewControllerProtocol {
    public var disposeBag = DisposeBag()
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setStyle()
        setDelegate()
        setHierarchy()
        setLayout()
        setBind()
    }
    

    open func setStyle() { }
    
    open func setDelegate() { }
    
    open func setHierarchy() { }
    
    open func setLayout() { }
    
    open func setBind() { }
}

public extension BaseViewController {
    func pushView(vc: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(vc, animated: animated)
    }
    
    func pushWebView(_ url: URL) {
        let nextVC = WebViewController(url: url)
        nextVC.hidesBottomBarWhenPushed = true
        self.pushView(vc: nextVC)
    }
    
    
    func backView(animated: Bool = true) {
        self.navigationController?.popViewController(animated: animated)
    }
}
