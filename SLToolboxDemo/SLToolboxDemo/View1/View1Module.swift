//
//  View1Module.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

class View1Module {

	class func buildDefault(for coordinator: View1CoordinatorLogic) -> View1ViewController {

		let view = View1ViewController.instantiate()
		view.title = "View1" // TODO: change it
		
		let interactor = View1Interactor()
		let presenter = View1Presenter(interactor: interactor, coordinator: coordinator)

		presenter.setView(view)
		view.setPresenter(presenter)

		return view
	}
}


enum View1Event {
    case viewDidLoad
}

enum View1Action {

}