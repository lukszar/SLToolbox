//
//  Coordinator.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 30/01/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

public protocol Coordinator: class {
    var childCoordinators: [Coordinator] { get set }
    func start()
}
