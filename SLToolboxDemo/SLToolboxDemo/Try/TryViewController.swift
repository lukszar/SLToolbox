//
//  TryViewController.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/09/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.


import UIKit

protocol TryViewControllerLogic: class {
	// interface for displaying results by presenter
}

class TryViewController: UIViewController {

	var interactor: TryInteractorLogic?
    var router: TryRouterType?

    // MARK: View

	override func viewDidLoad() {
        super.viewDidLoad()
        
    }


}


extension TryViewController : TryViewControllerLogic {

}
