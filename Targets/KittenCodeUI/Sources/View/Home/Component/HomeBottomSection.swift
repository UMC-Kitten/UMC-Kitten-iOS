//
//  HomeBottomSection.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/8/24.
//

import UIKit

import KittenCommonUI

class HomeBottomSection: BaseView {
    
    // MARK: Constant
    private let CELL_RIGHT_MARGIN: CGFloat = 30
    
    // MARK: UI Component
    private let customerServiceLabel: UILabel = .init(staticText: "고객센터")
    private let customerServiceArrow: UIImageView = .init(imageName: "arrow-right-black")
    private let customerServiceInfo: UILabel = .init(staticText: "평일 09:00~18:00 \n토요일 , 공휴일 : 휴무")
    
    // MARK: Set Method
    public override func setStyle() {
        super.setStyle()
        
        self.backgroundColor = .grayScale100
        
        customerServiceLabel.setDefaultFont(size: 16, weight: .bold)
    
        customerServiceArrow.contentMode = .scaleAspectFit
        
        customerServiceInfo.setDefaultFont(size: 14)
        customerServiceInfo.textColor = .grayScale600
        customerServiceInfo.numberOfLines = 2

    }
    
    public override func setHierarchy() {
        super.setHierarchy()
        
        [customerServiceLabel, customerServiceArrow, customerServiceInfo]
            .forEach { addSubview($0) }
        
    }
    
    public override func setLayout() {
        super.setLayout()
        
        customerServiceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(HomeConstant.HOME_PAGE_PADDING)
            $0.left.equalToSuperview().inset(HomeConstant.HOME_PAGE_PADDING)
        }
        
        customerServiceArrow.snp.makeConstraints {
            $0.centerY.equalTo(customerServiceLabel.snp.centerY)
            $0.left.equalTo(customerServiceLabel.snp.right).offset(5)
            $0.width.height.equalTo(12)
        }
        
        customerServiceInfo.snp.makeConstraints {
            $0.top.equalTo(customerServiceLabel.snp.bottom).offset(5)
            $0.left.equalToSuperview().inset(HomeConstant.HOME_PAGE_PADDING)
            $0.bottom.equalToSuperview().inset(HomeConstant.HOME_PAGE_PADDING+10)
        }
        

    }
}
