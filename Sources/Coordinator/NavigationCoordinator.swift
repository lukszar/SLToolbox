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
    
    /*  Used for ending lifecycle of the coordinator. In case of chaining few coordinators and passing between them navigationController instance, it will set delegate back to parentCoordinator.
 
        If parent coordinator has own navigationController or tabBarController, nothing will happen.
     **/
    final override func end() {
        if let coord = parentCoordinator as? NavigationCoordinator {
            // WARNING! don't set coord.navigationController.delegate; in case of different navigationController in parent such set would destroy delegate handling.
            navigationController.delegate = coord
        }
        super.end()
    }
    
    public func dismiss(animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.navigationController.dismiss(animated: animated, completion: completion)
        }
        end()
    }
    
    public func push(_ viewConroller: UIViewController, animated: Bool) {
        DispatchQueue.main.async {
            self.navigationController.pushViewController(viewConroller, animated: animated)
        }
    }
    
    public func present(_ viewConroller: UIViewController, animated: Bool, completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            self.navigationController.present(viewConroller, animated: animated, completion: completion)
        }
    }

    public func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {

        guard let fromVC = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        if navigationController.viewControllers.contains(fromVC) { return }

        let isModal = navigationController.transitionCoordinator?.presentationStyle != nil
        
        if isModal { return }
        
        if navigationController.transitionCoordinator?.isInteractive == true {
            navigationController.transitionCoordinator?.notifyWhenInteractionEnds({ (context) in
                if !context.isCancelled {
                    self.end()
                }
            })
        } else {
            end()
        }
        
        completionHandler?()
    }
    
    
}
