//
//  InlineConfigurable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 17/07/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public struct Configurator<T> {

    private let configureHandler: (T) -> Void

    public init(_ configuration: @escaping (T) -> Void) {
        self.configureHandler = configuration
    }
    
    public func configure(_ element: T) -> T {
        configureHandler(element)
        return element
    }
}

public protocol InlineConfigurable {}

extension InlineConfigurable where Self: AnyObject {

    /**
     Configure object inline with closures

     - parameter configurator: closure used to configure Self

     - returns: Self
     */
    @discardableResult
    public func configured(_ configurator: (Self) throws -> Void) rethrows -> Self {
        // Run the provided configurator:
        try configurator(self)
        return self
    }
    
    @discardableResult
    public func configure(using configurator: Configurator<Self>) -> Self {
        return configurator.configure(self)
    }
    
}


extension NSObject: InlineConfigurable {}
