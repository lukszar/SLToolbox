//
//  Reusable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 19/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol ClassReusable: Reusable {}
public protocol NibReusable: Reusable, NibLoadable {}


public protocol Reusable: class {
    /// Used for registering and dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

public extension Reusable {
    /// Default implementation of reuseIdentifier - take name of the class
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
