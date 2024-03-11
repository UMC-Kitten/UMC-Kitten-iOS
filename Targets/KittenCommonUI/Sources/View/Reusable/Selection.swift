//
//  Selectable.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/15/24.
//

import Foundation
import UIKit

import RxSwift

public class Selection: UIView {
    
    private var selectedIndex: Int = 0
    private let items: [Selection.Item]
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    
    public let onChange: PublishSubject<Int> = .init()
    
    public init(items: [Selection.Item]) {
        self.items = items
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setDefaultSelectedIndex(_ index: Int) {
        selectedIndex = index
        initializeItems()
    }
    
    private func initializeItems() {
        for (index, item) in items.enumerated() {
            item.isSelected = (index == selectedIndex)
        }
        
        for item in items {
            stackView.addArrangedSubview(item)
            item.onSelect = { [weak self] in
                guard let index = self?.items.firstIndex(of: item) else { return }
                self?.selectedIndex = index
                self?.onChange.onNext(index)
                self?.deselectOtherItems()
            }
        }
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    private func deselectOtherItems() {
        for (index, item) in items.enumerated() {
            if (index != selectedIndex) {
                item.isSelected = false
            }
        }
    }
    
    public class Item: UIView {
        var isSelected: Bool = false {
            didSet {
                if isSelected {
                    onSelect?()
                    contentView?.configureSelectUI()
                } else {
                    contentView?.configureDeselectUI()
                }
            }
        }
        
        private var contentView: SelectionItemProtocol?
        
        fileprivate var onSelect: (() -> Void)?
        
        override init(frame: CGRect) {
            super.init(frame: frame)
            setupGestureRecognizers()
        }
        
        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            setupGestureRecognizers()
        }
        
        public convenience init(
            contentView: SelectionItemProtocol
        ) {
            self.init(frame: .zero)
            self.contentView = contentView
            
            setupUI()
        }
        
        private func setupUI() {
            if let contentView = contentView {
                addSubview(contentView)
                contentView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
                    contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
                    contentView.topAnchor.constraint(equalTo: topAnchor),
                    contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
                ])
            }
        }
        
        private func setupGestureRecognizers() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture(_:)))
            addGestureRecognizer(tapGesture)
        }
        
        @objc private func handleTapGesture(_ gesture: UITapGestureRecognizer) {
            isSelected = true
        }
    }
}

public protocol SelectionItemProtocol: UIView {
    func configureSelectUI()
    func configureDeselectUI()
}

