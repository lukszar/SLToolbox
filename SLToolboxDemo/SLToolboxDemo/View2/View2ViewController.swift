//
//  View2ViewController.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.


import UIKit

protocol View2DisplayLogic: class {
	func setPresenter(_ presenter: View2PresenterLogic)
	func didUpdateView2(_ viewModel: View2ViewModel)
	// interface for displaying results by presenter
}

class View2ViewController: UIViewController {

	private var presenter: View2PresenterLogic?

	// MARK: IBOutlets

	// MARK: IBActions

    // MARK: View Lifesycle

	override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        presenter?.didReceiveEvent(.viewDidLoad)
    }

    // MARK: Private methods

    fileprivate func setupViews() {

    }

}


extension View2ViewController : View2DisplayLogic {

    func setPresenter(_ presenter: View2PresenterLogic) {
        self.presenter = presenter
    }

    func didUpdateView2(_ viewModel: View2ViewModel) {
    	// update view with view model here...
    }
}
