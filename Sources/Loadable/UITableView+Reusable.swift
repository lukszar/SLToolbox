//
//  UITableView+Reusable.swift
//  SLToolbox
//
//  Created by Lukasz Szarkowicz on 19/04/2019.
//  Copyright © 2019 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

public extension UITableView {

    // MARK: - Registration Helpers

    /// Keys used to save associated objects for UITableView.
    private enum AssociatedKeys {
        static var registeredCells: UInt8 = 0
        static var registeredHeaderFooterViews: UInt8 = 1
    }

    /// Set of ReuseIdentifiers for registered cells in the table view.
    private var registeredCells: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredCells, defaultValue: Set<String>())
        }
        set {
            setAssociatedObject(for: &AssociatedKeys.registeredCells, value: newValue)
        }
    }

    /// It registers a cell in the table view if the cell is NOT registered yet
    private func registerIfNeeded<T: UITableViewCell>(_ cell: T.Type) {
        if registeredCells.contains(cell.reuseIdentifier) == false {
            register(cell)
        }
    }

    /// Set of ReuseIdentifiers for registered header and footer views in the table view.
    private var registeredHeaderFooterViews: Set<String> {
        get {
            return getAssociatedObject(for: &AssociatedKeys.registeredHeaderFooterViews, defaultValue: Set<String>())
        }

        set {
            setAssociatedObject(for: &AssociatedKeys.registeredHeaderFooterViews, value: newValue) }
    }

    /// It registers a header or footer view in the table view if the view is NOT registered yet
    private func registerHeaderFooterViewIfNeeded<T: UITableViewHeaderFooterView>(_ view: T.Type) {
        if registeredHeaderFooterViews.contains(T.reuseIdentifier) == false {
            register(T.self)
        }
    }

    // MARK: - Cell

    /**
     Register a cell with the table view using CellType under ReuseIdentifier as identifier.

     - parameter cell: class type to register - subclass of `UITableViewCell` conforming `Reusable` protocol

     - seealso: `func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing cell with
     ````
     final func dequeueReusableCell<T>(for indexPath: IndexPath,
     with cell: T.Type = T.self,
     configure: ((T) -> Void) = { _ in }) -> T where T : UITableViewCell
     ````
     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewCell>(_ cell: T.Type) {

        registeredCells.insert(T.reuseIdentifier)
        if let nib = cell.nib {
            register(nib, forCellReuseIdentifier: cell.reuseIdentifier)
        } else {
            register(cell.self, forCellReuseIdentifier: cell.reuseIdentifier)
        }
    }

    /**
     Dequeue a reusable cell for given type (`UITableViewCell` subclass) conforming Reusable protocol

     - parameter indexPath: the index path defining coordinates of cell.

     - parameter cell: class type to dequeue. Subclass of `UITableViewCell` conforming `Reusable` protocol.

     - parameter configure: handler to configure cell after dequeue.

     - seealso: `func dequeueReusableCell(withIdentifier identifier: String, for indexPath: IndexPath) -> UITableViewCell`

     Cell is automaticaly registered before dequeing.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableCell<T: UITableViewCell>
        (for indexPath: IndexPath,
        with cell: T.Type = T.self,
        configure: ((T) -> Void) = { _ in }) -> T {

        registerIfNeeded(T.self)

        guard let cellElement = self.dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            let msg = """
            Failed to deque a reusable cell view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

            Possible solutions:
            - check if reuseIdentifier is set in your Storyboard or XIB file,
            """
            fatalError(msg)
        }

        configure(cellElement)
        return cellElement
    }

    // MARK: - Header / Footer View

    /**
     Register a header or footer with the table view using CellType under ReuseIdentifier as identifier.

     - parameter headerFooter: class type to register - subclass of `UITableViewHeaderFooterView` conforming `Reusable` protocol

     - seealso: `func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String)`

     Registration is done automaticaly under the hood during dequeing view with
     ````
     final func dequeueReusableHeaderFooterView<T>(for view: T.Type = T.self,
     configure: ((T) -> Void) = { _ in }) -> T
     where T : UITableViewHeaderFooterView
     ````

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func register<T: UITableViewHeaderFooterView>(_ headerFooter: T.Type) {

        registeredHeaderFooterViews.insert(T.reuseIdentifier)

        if let nib = headerFooter.nib {
            register(nib, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
        } else {
            register(headerFooter.self, forHeaderFooterViewReuseIdentifier: headerFooter.reuseIdentifier)
        }
    }


    /**
     Dequeue a reusable header/footer view for given type (`UITableViewHeaderFooterView` subclass) conforming Reusable protocol

     - parameter view: class type to dequeue. Subclass of `UITableViewHeaderFooterView` conforming `Reusable` protocol.

     - parameter configure: handler to configure view after dequeue.

     - seealso: `func dequeueReusableHeaderFooterView(withIdentifier identifier: String) -> UITableViewHeaderFooterView?`

     View is automaticaly registered before dequeing.

     - Author: SLToolbox - Łukasz Szarkowicz
     */
    final func dequeueReusableHeaderFooterView<T: UITableViewHeaderFooterView>
        (for view: T.Type = T.self,
         configure: ((T) -> Void) = { _ in }) -> T {

        registerHeaderFooterViewIfNeeded(T.self)
        guard let view = self.dequeueReusableHeaderFooterView(withIdentifier: view.reuseIdentifier) as? T else {

            let msg = """
            Failed to deque view with reuse identifier: \(T.self.reuseIdentifier) and matching type: \(T.self.self)

            Possible solutions:
                - check if reuseIdentifier is set in your Storyboard or XIB file,
            """
            fatalError(msg)
        }

        configure(view)
        return view
    }
}
