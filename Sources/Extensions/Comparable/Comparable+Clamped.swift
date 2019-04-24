//
//  Comparable+Clamped.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 22/02/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public extension Comparable {
    /**
     Limit any comparable value to some boundaries.

     - parameter limits: Range value describing upper and lower bounds to which value should be clamped.

     - returns: object of the same type clamped inside limits.

     - Author:
     SLToolbox - Łukasz Szarkowicz
     */
    func clamped(to limits: ClosedRange<Self>) -> Self {
        return min(max(self, limits.lowerBound), limits.upperBound)
    }
}
