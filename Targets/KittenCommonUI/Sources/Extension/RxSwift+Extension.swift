//
//  RxSwift+Extension.swift
//  UMC-Kitten-iOS
//
//  Created by DOYEON LEE on 2/14/24.
//

import Foundation

import RxSwift

public extension ObservableType where Element: OptionalType {
    
//    func weakify<Instance: AnyObject>(_ instance: Instance) -> Observable<(Instance, Element)> {
//        return self.map { [weak instance] element -> (Instance, Element)? in
//            guard let instance = instance else { return nil }
//            return (instance, element)
//        }
//        .filterNil()
//    }
    
    func filterNil() -> Observable<Element.Wrapped> {
        return self.compactMap { $0.asOptional() }
    }
}

public protocol OptionalType {
    associatedtype Wrapped
    func asOptional() -> Wrapped?
}

extension Optional: OptionalType {
    public func asOptional() -> Wrapped? {
        return self
    }
}
