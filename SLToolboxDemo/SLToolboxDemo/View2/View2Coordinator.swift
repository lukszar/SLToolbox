//
//  View2Coordinator.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

protocol View2CoordinatorLogic: class {
	func start()
}

// Choose parent class from: NavigationCoordinator, TabBarCoordinator, BaseCoordinator
final class View2Coordinator: NavigationCoordinator {

	override func start() {
		let view = View2Module.buildDefault(for: self)

		navigationController.setViewControllers([view], animated: false)
	}
}

extension View2Coordinator: View2CoordinatorLogic {

}