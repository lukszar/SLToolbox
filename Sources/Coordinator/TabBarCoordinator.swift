//
//  TabBarCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

open class TabBarCoordinator: BaseCoordinator, UITabBarControllerDelegate {

    public var tabController: UITabBarController

    public var viewControllers: [UIViewController] {
        return self.childCoordinators.compactMap { ($0 as? NavigationCoordinator)?.navigationController }
    }
    
    override public convenience init() {
        let tab = UITabBarController()
        self.init(tabController: tab)
    }

    public init(tabController: UITabBarController) {

        self.tabController = tabController
        super.init()
        self.tabController.delegate = self
    }
}
