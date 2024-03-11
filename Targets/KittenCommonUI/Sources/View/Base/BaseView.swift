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

open class BaseView: UIView, BaseViewProtocol {
    var disposeBag = DisposeBag()
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(frame: CGRect) {
        print(#function)
        super.init(frame: frame)
        
//        setStyle()
//        setHierarchy()
//        setLayout()
//        setBind()
    }
    
    public init() {
        super.init(frame: .zero)
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        setStyle()
        setHierarchy()
        setLayout()
        setBind()
    }
    
    open func setStyle() { }
    
    open func setHierarchy() { }
    
    open func setLayout() { }
    
    open func setBind() { }
}

