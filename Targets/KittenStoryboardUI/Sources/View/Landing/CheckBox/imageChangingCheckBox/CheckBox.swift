//
//  CheckBox.swift
//  UMC-Kitten-iOS
//
//  Created by Jongkwon on 1/29/24.
//

import UIKit

@IBDesignable
class CheckBox: UIControl {
    
    private var image: UIImage {
        return checked ? UIImage(systemName: "checkmark.square.fill")! :
        UIImage(systemName: "square")!
    }
    
    @IBInspectable
    public var checked: Bool = false {
        didSet {
            imageView.image = image
        }
    }

    private weak var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        
        let imageView = UIImageView()
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
            
            
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
            
        imageView.image = UIImage(systemName: "checkmark.square.fill")
        imageView.contentMode = .scaleAspectFit
            
        self.imageView =  imageView
            
        backgroundColor = UIColor.clear
        
        addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    }
    
    @objc func touchUpInside() {
        checked = !checked
        sendActions(for: .valueChanged)
    }
}
