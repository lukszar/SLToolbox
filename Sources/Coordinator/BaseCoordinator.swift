//
//  BaseCoordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

open class BaseCoordinator: NSObject, Coordinator {
    
    fileprivate(set) weak var parentCoordinator: Coordinator?
    public var childCoordinators: [Coordinator]

    public var completionHandler: (() -> Void)?

    override init() {
        childCoordinators = []
    }

    public func start() {
        fatalError("Implementation for start() method not provided. Provide implementation for \(self)")
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
}
