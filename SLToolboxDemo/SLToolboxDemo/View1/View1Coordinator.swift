//
//  View1Coordinator.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

protocol View1CoordinatorLogic: class {
	func start()
}

// Choose parent class from: NavigationCoordinator, TabBarCoordinator, BaseCoordinator
final class View1Coordinator: NavigationCoordinator {

	override func start() {
		let view = View1Module.buildDefault(for: self)

		navigationController.setViewControllers([view], animated: false)
	}
}

extension View1Coordinator: View1CoordinatorLogic {

}