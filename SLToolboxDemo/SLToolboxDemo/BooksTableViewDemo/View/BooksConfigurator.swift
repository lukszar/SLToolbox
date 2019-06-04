//
//  BooksConfigurator.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit


final class BooksConfigurator {

    static let shared = BooksConfigurator()

    func configureBooksModule(with viewController: BooksViewController?) {

        let presenter = BooksPresenter(viewController: viewController)
        let interactor = BooksInteractor(presenter: presenter)
        let router = BooksRouter(viewController: viewController, dataStore: interactor)

        viewController?.interactor = interactor
        viewController?.router = router
    }
        
}
