//
//  Reusable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 19/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

//public protocol ClassReusable: Reusable {}
//public protocol NibReusable: Reusable, NibLoadable {}


public protocol Reusable: class {
    /// Used for registering and dequeuing a reusable cell
    static var reuseIdentifier: String { get }
    static var nibName: String? { get }
    static var nib: UINib? { get }
}

public extension Reusable {
    /// Default implementation of reuseIdentifier - take name of the class
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    static var nibName: String? {
        return String(describing: self)
    }

    static var nib: UINib? {
        let bundle = Bundle(for: self)

        if let name = nibName, bundle.path(forResource: name, ofType: "nib") != nil {
            return UINib(nibName: name, bundle: bundle)
        } else if bundle.path(forResource: reuseIdentifier, ofType: "nib") != nil {
            return UINib(nibName: reuseIdentifier, bundle: bundle)
        } else {
            return nil
        }
    }
}

extension UITableViewCell: Reusable {}
extension UICollectionViewCell: Reusable {}
extension UITableViewHeaderFooterView: Reusable {}
extension UICollectionReusableView: Reusable {}

