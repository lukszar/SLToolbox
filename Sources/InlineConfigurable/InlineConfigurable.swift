//
//  InlineConfigurable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 17/07/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol InlineConfigurable {}

extension InlineConfigurable {

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
}


extension NSObject: InlineConfigurable {}
