//
//  NibOwnerLoadable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 23/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public protocol NibOwnerLoadable: class {
    static var nibName: String { get }
    static var nib: UINib { get }

    var contentView: UIView? { get set }
}

public extension NibOwnerLoadable {

    /// Nib's file name - where view is designed
    static var nibName: String {
        return String(describing: self)
    }

    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: Bundle(for: self))
    }
}

public extension NibOwnerLoadable where Self: UIView {

    func loadFromNib() {

        let viewsInNib = Self.nib.instantiate(withOwner: self, options: nil).compactMap { $0 as? UIView }

        for element in viewsInNib {
            setupLayout(for: element)
        }

        contentView = viewsInNib.first
    }

    fileprivate func setupLayout(for view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)

        let attributes: [NSLayoutConstraint.Attribute] = [.top, .trailing, .bottom, .leading]

        let constraints = attributes.map({ attr -> NSLayoutConstraint in
            return NSLayoutConstraint(item: view,
                                      attribute: attr,
                                      relatedBy: .equal,
                                      toItem: self,
                                      attribute: attr,
                                      multiplier: 1.0,
                                      constant: 0.0)
        })

        NSLayoutConstraint.activate(constraints)
    }
}
