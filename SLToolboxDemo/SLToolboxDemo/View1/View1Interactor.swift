//
//  View1Interactor.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 11/03/2020.
//  Copyright © 2020 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

protocol View1InteractorLogic: class {
	// interface of Interactor
}

protocol View1DataStore: class {
    // interface for stored data
}

class View1Interactor: View1DataStore {

        
}

extension View1Interactor: View1InteractorLogic {

}
