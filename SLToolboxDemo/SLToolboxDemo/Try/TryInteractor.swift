//
//  TryInteractor.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/09/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

protocol TryInteractorLogic {
	// interface for triggering fetching data
}

protocol TryDataStore {
    // interface for stored data
}

class TryInteractor: TryDataStore {

	private var presenter: TryPresenterLogic?
    // var worker: TryWorker?

    init(presenter: TryPresenterLogic?) {
        self.presenter = presenter
    }
        
}

extension TryInteractor: TryInteractorLogic {

}
