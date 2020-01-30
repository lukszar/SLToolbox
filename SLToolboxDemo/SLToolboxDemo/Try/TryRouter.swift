//
//  TryRouter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/09/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

typealias TryRouterType = TryRouterProtocol & TryDataPassing

@objc protocol TryRouterProtocol {

}

protocol TryDataPassing {

}


final class TryRouter: TryDataPassing {

    weak var viewController: TryViewController?
    var dataStore: TryDataStore?

    init(viewController: TryViewController?, dataStore: TryDataStore) {

        self.viewController = viewController
        self.dataStore = dataStore
    }
        
}

extension TryRouter: TryRouterProtocol {

}
