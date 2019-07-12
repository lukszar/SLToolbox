//
//  BooksInteractor.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation
import SLToolbox

protocol BooksInteractorLogic {
	// interface for triggering fetching data

    func fetchBooks(request: BooksActions.Get.Request)
}

protocol BooksDataStore {
    // interface for stored data
}

class BooksInteractor: BooksDataStore {

	private var presenter: BooksPresenterLogic?
    // var worker: BooksWorker?

    init(presenter: BooksPresenterLogic?) {
        self.presenter = presenter
    }
        
}

extension BooksInteractor: BooksInteractorLogic {
    func fetchBooks(request: BooksActions.Get.Request) {
        Delay.after(0.6) {

            let list = Book.dumpData

            self.presenter?.presentFetchedBooks(response: BooksActions.Get.Response(books: list))
        }
    }
}
