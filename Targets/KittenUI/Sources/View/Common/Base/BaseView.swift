//
//  BaseView.swift
//  HumanscapeShoppingMall
//
//  Created by DOYEON LEE on 2023/05/30.
//

import UIKit

import RxSwift

protocol BaseViewProtocol {
    func setStyle()
    func setHierarchy()
    func setLayout()
    func setBind()
}

class BaseView: UIView, BaseViewProtocol {
    var disposeBag = DisposeBag()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
        setBind()
    }
    
    func setStyle() { }
    
    func setHierarchy() { }
    
    func setLayout() { }
    
    func setBind() { }
}

