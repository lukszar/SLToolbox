//
//  StoryboardLoadable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 24/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public protocol StoryboardLoadable {
    static var storyboardName: String { get }
    static var storyboardIdentifier: String? { get }
}

public extension StoryboardLoadable where Self: UIViewController {

    static var storyboardName: String {
        return String(describing: self)
    }

    static func instantiate() -> Self {

        let bundle = Bundle(for: self)
        let storyboard = UIStoryboard(name: storyboardName, bundle: bundle)

        if let identifier = storyboardIdentifier {
            return instantiateVC(withIdentifier: identifier, in: storyboard)
        } else {
            return instantiateInitialVC(from: storyboard)
        }
    }

    fileprivate static func instantiateInitialVC(from storyboard: UIStoryboard) -> Self {
        guard let newVC = storyboard.instantiateInitialViewController() as? Self else {
            fatalError()
        }

        return newVC
    }

    fileprivate static func instantiateVC(withIdentifier identifier: String, in storyboard: UIStoryboard) -> Self {
        guard let newVC = storyboard.instantiateViewController(withIdentifier: identifier) as? Self else {
            fatalError()
        }

        return newVC
    }
}


