//
//  BaseCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

open class BaseCoordinator: NSObject, Coordinator {
    public var presentingViewController: UIViewController?
    
    fileprivate(set) weak var parentCoordinator: BaseCoordinator?
    public private(set) var childCoordinators: [Coordinator]

    public var completionHandler: (() -> Void)?

    override public init() {
        childCoordinators = []
        super.init()
    }
    
    open func start() {
        fatalError("Implementation for start() method not provided. Provide implementation for \(self)")
    }
    
    
    func end() {
        parentCoordinator?.remove(coordinator: self)
    }
    
    public func closeView() {
        presentingViewController?.dismiss(animated: true, completion: { self.end() })
    }
}

extension BaseCoordinator {

    public func add<T: BaseCoordinator>(coordinator: T) {
        coordinator.parentCoordinator = self
        childCoordinators.append(coordinator)
    }

    public func remove<T: Coordinator>(coordinator: T) {
        childCoordinators = childCoordinators.filter { $0 !== coordinator }
    }
    
    /// Remove all child coordinators
    public func removeAll() {
        childCoordinators.removeAll()
    }
}
