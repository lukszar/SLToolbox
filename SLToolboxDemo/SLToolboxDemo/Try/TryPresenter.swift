//
//  TryPresenter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/09/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//  

import UIKit

protocol TryPresenterLogic {
	// interface for passing data from Interactor to Presenter
}

class TryPresenter {

	private weak var viewController: TryViewControllerLogic?

    init(viewController: TryViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension TryPresenter : TryPresenterLogic {

}
