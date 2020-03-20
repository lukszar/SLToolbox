//
//  View2Module.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import SLToolbox

class View2Module {

	class func buildDefault(for coordinator: View2CoordinatorLogic) -> View2ViewController {

		let view = View2ViewController.instantiate()
		view.title = "View2" // TODO: change it
		
		let interactor = View2Interactor()
		let presenter = View2Presenter(interactor: interactor, coordinator: coordinator)

		presenter.setView(view)
		view.setPresenter(presenter)

		return view
	}
}


enum View2Event {
    case viewDidLoad
}

enum View2Action {

}