//
//  BooksViewController.swift
//  SLToolboxDemo
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.


import UIKit
import SLToolbox

protocol BooksViewControllerLogic: class {
	// interface for displaying results by presenter

    func displayBooks(collection: Collection)
}

class BooksViewController: UIViewController {

	var interactor: BooksInteractorLogic?
    var router: BooksRouterType?

    var tableViewModel: BooksTableViewModel?

    @IBOutlet weak var tableView: UITableView!

    // MARK: View

    override func loadView() {
        super.loadView()

        BooksConfigurator.shared.configureBooksModule(with: self)
    }

	override func viewDidLoad() {
        super.viewDidLoad()

        tableViewModel = BooksTableViewModel()
        tableViewModel?.delegate = self

        interactor?.fetchBooks(request: BooksActions.Get.Request())
    }
}


extension BooksViewController : BooksViewControllerLogic {
    func displayBooks(collection: Collection) {
        tableViewModel?.update(with: collection)
        tableView.reloadData()
    }
}

extension BooksViewController: TableViewModelDelegate {
    func didSelectRow(at indexPath: IndexPath) {
        return
    }
}

extension BooksViewController: StoryboardLoadable {}
