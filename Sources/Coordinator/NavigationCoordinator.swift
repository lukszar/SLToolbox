//
//  NavigationCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public class NavigationCoordinator: BaseCoordinator, UINavigationControllerDelegate {

    var navigationController: UINavigationController

    override convenience init() {
        let nav = UINavigationController()
        self.init(navigationController: nav)
    }

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) { return }

        completionHandler?()
    }
}
