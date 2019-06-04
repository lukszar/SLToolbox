//
//  BooksRouter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

typealias BooksRouterType = BooksRouterProtocol & BooksDataPassing

@objc protocol BooksRouterProtocol {

}

protocol BooksDataPassing {

}


final class BooksRouter: BooksDataPassing {

    weak var viewController: BooksViewController?
    var dataStore: BooksDataStore?

    init(viewController: BooksViewController?, dataStore: BooksDataStore) {

        self.viewController = viewController
        self.dataStore = dataStore
    }
        
}

extension BooksRouter: BooksRouterProtocol {

}
