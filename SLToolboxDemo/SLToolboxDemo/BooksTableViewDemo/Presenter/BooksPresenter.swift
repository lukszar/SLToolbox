//
//  BooksPresenter.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//  

import UIKit
import SLToolbox

protocol BooksPresenterLogic {
	// interface for passing data from Interactor to Presenter
    func presentFetchedBooks(response: BooksActions.Get.Response)
}

class BooksPresenter {

	private weak var viewController: BooksViewControllerLogic?

    init(viewController: BooksViewControllerLogic?) {
        self.viewController = viewController
    }
}

extension BooksPresenter : BooksPresenterLogic {
    func presentFetchedBooks(response: BooksActions.Get.Response) {

        var viewModels = response.books.map { (book) -> BookCell.ViewModel in
            return BookCell.ViewModel(book: book)
            } .map { (viewModel) -> AnyCellViewModel in
                AnyCellViewModel(viewModel)
        }

        let others = Movie.dumpData.map { (movie) -> MovieCell.ViewModel in
            return MovieCell.ViewModel(movie: movie)
            } .map { (viewModel) -> AnyCellViewModel in
                AnyCellViewModel(viewModel)
        }

        viewModels.append(contentsOf: others)


        let col = CollectionDataSource(elements: viewModels)

        viewController?.displayBooks(collection: col)
    }
}
