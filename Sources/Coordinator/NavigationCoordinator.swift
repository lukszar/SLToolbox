//
//  NavigationCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

open class NavigationCoordinator: BaseCoordinator, UINavigationControllerDelegate {

    public var navigationController: UINavigationController

    override public convenience init() {
        let nav = UINavigationController()
        self.init(navigationController: nav)
    }

    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    
    public func push(_ viewConroller: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.pushViewController(viewConroller, animated: animated)
        }
    }
    
    public func present(_ viewConroller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        DispatchQueue.main.async {
            self.navigationController.present(viewConroller, animated: animated, completion: completion)
        }
    }

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) { return }

        completionHandler?()
    }
}
