//
//  TableViewModel.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 04/06/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

open class TableViewModel: NSObject, UITableViewDataSource, UITableViewDelegate {

    public typealias SelectionHandler = (Any, IndexPath) -> Void

    public init(initialCollection: CollectionDataSource? = nil,
                cellSelectHandler: @escaping SelectionHandler) {

        self.collection = initialCollection
        self.selectCellHandler = cellSelectHandler
        super.init()
    }

    private weak var tableView: UITableView?
    public private(set) var collection: CollectionDataSource?
    private var selectCellHandler: SelectionHandler


    /**
     Setup tableView for automatic reload data
     */
    public func setup(with tableView: UITableView) {
        tableView.dataSource = nil
        tableView.delegate = nil

        tableView.dataSource = self
        tableView.delegate = self

        self.tableView = tableView
    }

    public func update(with collection: CollectionDataSource) {
        self.collection = collection
        tableView?.reloadData()
    }

    // MARK: - Data Source

    public func numberOfSections(in tableView: UITableView) -> Int {
        return collection?.numberOfSections ?? 0
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return collection?.section(at: section)?.numberOfRows ?? 0
    }

    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        fatalError()
//        
//        guard let element = collection?.element(at: indexPath) as? AnyCellViewModel else {
//            fatalError()
//        }
//
////        let theCellType = cellType(for: element.base as! AnyHashable)
//
//
//        
//        let cell = tableView.dequeueReusableCell(for: indexPath, with: theCellType.self) { (cell) in
//            configureCell(cell, at: indexPath, with: element)
//        }
//
//        return cell
    }

    // MARK: - Delegate
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let element = collection?.element(at: indexPath) else { return }
        selectCellHandler(element, indexPath)
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return 200.0
    }

    public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {

        return 200.0
    }

//    private var configureCell: ((_ indexPath: IndexPath,
//                                _ cell: UITableViewCell,
//                                _ item: AnyHashable) -> Void)?
//
//    open func configureCell<T>(cellType: T.Type, _ callback: @escaping (_ indexPath: IndexPath, _ cell: UITableViewCell, _ item: AnyHashable) -> Void) {
//        configureCell = callback
//    }

    open func configureCell(_ cell: UITableViewCell, at indexPath: IndexPath, with element: AnyCellViewModel) {
        fatalError()
    }

    open func cellType(for element: AnyHashable) -> UITableViewCell.Type {
        fatalError()
    }

//    open func configure<T: Hashable, U: UITableViewCell>(with element: T, at indexPath: IndexPath) -> (cellType: U.Type, configureHandler: (T, U)->Void) {
//
//        fatalError()
//    }



}

