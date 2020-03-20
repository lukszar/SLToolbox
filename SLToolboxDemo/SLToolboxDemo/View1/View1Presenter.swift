//
//  View1Presenter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//  

import UIKit

protocol View1PresenterLogic: class {
	// interface for passing data from Interactor to Presenter

	func didReceiveEvent(_ event: View1Event)
    func didTriggerAction(_ action: View1Action)
    func setView(_ view: View1DisplayLogic & UIViewController)
}

class View1Presenter {

	private weak var view: (View1DisplayLogic & UIViewController)?
    private let interactor: View1InteractorLogic
    private weak var coordinator: View1CoordinatorLogic!

    init(interactor: View1InteractorLogic,
         coordinator: View1CoordinatorLogic) {

        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension View1Presenter : View1PresenterLogic {

    func setView(_ view: UIViewController & View1DisplayLogic) {
        self.view = view
    }

    func didReceiveEvent(_ event: View1Event) {
        switch event {
        case .viewDidLoad:
            print("")
        	// action for viewDidLoad event
        	// add more events in View1Event enum
        }

    }

    func didTriggerAction(_ action: View1Action) {
    	
    }
}
