//
//  NibLoadable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 23/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public protocol NibLoadable: class {
    static var nibName: String { get }
    static var nib: UINib { get }
}

public extension NibLoadable {

    /// Nib's file name - where view is designed
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibLoadable where Self: UIView {

    static func loadFromNib() -> Self {
        guard let view = nib.instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("Could not instantiate nib: \(nib) cause it expected it's root view to be \(self) type")
        }

        return view
    }
}

