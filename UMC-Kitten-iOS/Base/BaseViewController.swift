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
    func setContent()
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
        
        setContent()
        setStyle()
        setDelegate()
        setHierarchy()
        setLayout()
        setBind()
    }
    
    func setContent() { }

    func setStyle() { }
    
    func setDelegate() { }
    
    func setHierarchy() { }
    
    func setLayout() { }
    
    func setBind() { }
}
