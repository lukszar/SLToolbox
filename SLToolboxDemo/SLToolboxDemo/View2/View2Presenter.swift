//
//  View2Presenter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//  

import UIKit

protocol View2PresenterLogic: class {
	// interface for passing data from Interactor to Presenter

	func didReceiveEvent(_ event: View2Event)
    func didTriggerAction(_ action: View2Action)
    func setView(_ view: View2DisplayLogic & UIViewController)
}

class View2Presenter {

	private weak var view: (View2DisplayLogic & UIViewController)?
    private let interactor: View2InteractorLogic
    private weak var coordinator: View2CoordinatorLogic!

    init(interactor: View2InteractorLogic,
         coordinator: View2CoordinatorLogic) {

        self.interactor = interactor
        self.coordinator = coordinator
    }
}

extension View2Presenter : View2PresenterLogic {

    func setView(_ view: UIViewController & View2DisplayLogic) {
        self.view = view
    }

    func didReceiveEvent(_ event: View2Event) {
        switch event {
        case .viewDidLoad:
            print("")
        	// action for viewDidLoad event
        	// add more events in View2Event enum
        }

    }

    func didTriggerAction(_ action: View2Action) {
    	
    }
}
