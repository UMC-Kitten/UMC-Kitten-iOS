//
//  BaseCollectionViewCell.swift
//  HumanscapeShoppingMall
//
//  Created by DOYEON LEE on 2023/05/30.
//

import Foundation
import UIKit


open class BaseCollectionViewCell: UICollectionViewCell, BaseViewProtocol {
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        setStyle()
        setHierarchy()
        setLayout()
        setBind()
    }
    
    public override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    open func setStyle() { }
    
    open func setHierarchy() { }
    
    open func setLayout() { }
    
    open func setBind() { }
}
