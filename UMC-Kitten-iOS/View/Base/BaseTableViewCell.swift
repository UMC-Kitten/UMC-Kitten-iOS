//
//  BaseTableViewCell.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/30/24.
//

import UIKit

class BaseTableViewCell: UITableViewCell, BaseViewProtocol {
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
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
