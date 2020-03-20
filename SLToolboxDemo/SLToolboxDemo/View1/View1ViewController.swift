//
//  View1ViewController.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.


import UIKit

protocol View1DisplayLogic: class {
	func setPresenter(_ presenter: View1PresenterLogic)
	func didUpdateView1(_ viewModel: View1ViewModel)
	// interface for displaying results by presenter
}

class View1ViewController: UIViewController {

	private var presenter: View1PresenterLogic?

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


extension View1ViewController : View1DisplayLogic {

    func setPresenter(_ presenter: View1PresenterLogic) {
        self.presenter = presenter
    }

    func didUpdateView1(_ viewModel: View1ViewModel) {
    	// update view with view model here...
    }
}
