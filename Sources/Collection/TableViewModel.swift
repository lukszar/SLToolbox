//
//  TableViewModel.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import Foundation

open class TableViewModel: NSObject {

    public weak var delegate: TableViewModelDelegate? {
        didSet {
            self.registerCells()
            delegate?.tableView.dataSource = self
            delegate?.tableView.delegate = self
        }
    }
    public var collection: Collection?


    public func update(with collection: Collection) {
        self.collection = collection
    }

    open func registerCells() {
        logError(message: "Should be provided registerCells() method")
        fatalError()
    }

    open func cellType(for indexPath: IndexPath) -> UITableViewCell.Type {
        logError(message: "cellType(for indexPath: IndexPath) should be implemented")
        fatalError()
    }

}

extension TableViewModel: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection?.numberOfRowsInSection(section) ?? 0
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("You have to provide implementation of 'func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell' function for \(type(of: self))")
    }
}

extension TableViewModel: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectRow(at: indexPath)
    }
}
