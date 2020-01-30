//
//  TryConfigurator.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/09/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit


final class TryConfigurator {

    static let shared = TryConfigurator()

    func configureTryModule(with viewController: TryViewController?) {

        let presenter = TryPresenter(viewController: viewController)
        let interactor = TryInteractor(presenter: presenter)
        let router = TryRouter(viewController: viewController, dataStore: interactor)

        viewController?.interactor = interactor
        viewController?.router = router
    }
        
}
