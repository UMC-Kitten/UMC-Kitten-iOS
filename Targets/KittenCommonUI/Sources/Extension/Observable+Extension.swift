//
//  Observable+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 1/21/24.
//

import Foundation

import RxSwift

public extension ObservableType {
    func dropFirst() -> Observable<Element> {
        self.skip(1)
    }
}
