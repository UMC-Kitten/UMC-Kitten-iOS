//
//  BaseCollectionViewCell.swift
//  HumanscapeShoppingMall
//
//  Created by DOYEON LEE on 2023/05/30.
//

import Foundation
import UIKit


class BaseCollectionViewCell: UICollectionViewCell, BaseViewProtocol {
    
    
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setStyle() { }
    
    func setHierarchy() { }
    
    func setLayout() { }
    
    func setBind() { }
}
