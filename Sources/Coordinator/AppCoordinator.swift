//
//  AppCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

open class AppCoordinator: BaseCoordinator {

    fileprivate let window: UIWindow

    // MARK: - Computed properties

    var rootVC: UIViewController? {
        return window.rootViewController
    }

    // MARK: - Init

    init(window: UIWindow) {
        self.window = window
        super.init()
    }

    // MARK: - Flow
    func setRoot(vc: UIViewController, animated: Bool = true) {
        window.rootViewController = vc
        window.makeKeyAndVisible()

        if animated == true {
            let options: UIView.AnimationOptions = .transitionCrossDissolve
            let duration: TimeInterval = 0.3
            UIView.transition(with: window, duration: duration, options: options, animations: nil, completion: nil)
        }
    }
}
