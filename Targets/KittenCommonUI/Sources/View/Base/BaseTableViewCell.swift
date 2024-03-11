//
//  BaseTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

open class BaseTableViewCell: UITableViewCell, BaseViewProtocol {
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setStyle()
        setHierarchy()
        setLayout()
        setBind()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    open func setStyle() { }
    
    open func setHierarchy() { }
    
    open func setLayout() { }
    
    open func setBind() { }
}
